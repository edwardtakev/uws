#!/bin/bash

# Define the source and destination paths
SOURCE_FILE="motd.sh"
DEST_DIR="/etc/profile.d/"
MOTD_FILE="/etc/motd"

# Check if the source file exists
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Source file $SOURCE_FILE not found!"
    exit 1
fi

# Copy motd.sh to /etc/profile.d/
sudo cp "$SOURCE_FILE" "$DEST_DIR"

# Check if the copy was successful
if [[ $? -eq 0 ]]; then
    echo "$SOURCE_FILE has been copied to $DEST_DIR"
else
    echo "Failed to copy $SOURCE_FILE to $DEST_DIR"
    exit 1
fi

# Clear the contents of /etc/motd
sudo truncate -s 0 "$MOTD_FILE"

# Check if the operation was successful
if [[ $? -eq 0 ]]; then
    echo "/etc/motd has been cleared"
else
    echo "Failed to clear /etc/motd"
    exit 1
fi
