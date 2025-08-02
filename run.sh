#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'
BOLD='\e[1m'

# Define the source and destination paths
SOURCE_FILE="motd.sh"
DEST_DIR="/etc/profile.d/"
MOTD_FILE="/etc/motd"
BASHRC_FILE=".bashrc"
ROOT_BASHRC="/root/.bashrc"

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo -e "${RED}Source file $SOURCE_FILE not found!${RESET}"
    exit 1
fi

if [[ -f "${DEST_DIR}00_lxc-details.sh" ]]; then
    sudo rm -f "${DEST_DIR}00_lxc-details.sh"
    echo -e "${YELLOW}Removed existing LXC banner script: 00_lxc-details.sh${RESET}"
fi

sudo cp "$SOURCE_FILE" "$DEST_DIR"

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}$SOURCE_FILE has been copied to $DEST_DIR${RESET}"
else
    echo -e "${RED}Failed to copy $SOURCE_FILE to $DEST_DIR${RESET}"
    exit 1
fi

sudo truncate -s 0 "$MOTD_FILE"

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}/etc/motd has been cleared${RESET}"
else
    echo -e "${RED}Failed to clear /etc/motd${RESET}"
    exit 1
fi

if [[ ! -f "$BASHRC_FILE" ]]; then
    echo -e "${RED}No .bashrc file found in the current directory!${RESET}"
    exit 1
fi

sudo cp "$BASHRC_FILE" "$ROOT_BASHRC"

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}.bashrc has been replaced successfully${RESET}"
else
    echo -e "${RED}Failed to replace .bashrc${RESET}"
    exit 1
fi

echo -e "${GREEN}Script completed successfully!${RESET}"
echo -e "${YELLOW}→ Apply changes now by running: ${BOLD}${RED}source /root/.bashrc${RESET}"
