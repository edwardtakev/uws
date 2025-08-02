#!/bin/bash

# Define the source and destination paths
SOURCE_FILE="motd.sh"
DEST_DIR="/etc/profile.d/"
MOTD_FILE="/etc/motd"
BASHRC_FILE=".bashrc"
ROOT_BASHRC="/root/.bashrc"

# Check if the source file exists
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Source file $SOURCE_FILE not found!"
    exit 1
fi

# Remove LXC banner script if it exists
if [[ -f "${DEST_DIR}00_lxc-details.sh" ]]; then
    sudo rm -f "${DEST_DIR}00_lxc-details.sh"
    echo "Removed existing LXC banner script: 00_lxc-details.sh"
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

# Check if the .bashrc file exists in the current directory
if [[ ! -f "$BASHRC_FILE" ]]; then
    echo "No .bashrc file found in the current directory!"
    exit 1
fi

# Replace /root/.bashrc with the .bashrc from the current directory
sudo cp "$BASHRC_FILE" "$ROOT_BASHRC"

# Check if the replacement was successful
if [[ $? -eq 0 ]]; then
    echo ".bashrc has been replaced with the version from the current directory"
else
    echo "Failed to replace .bashrc"
    exit 1
fi

# Run 'source /root/.bashrc' to apply the changes
source "$ROOT_BASHRC"

echo "Script completed successfully!"
