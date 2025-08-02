#!/bin/bash

# Define color constants
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'
BOLD='\e[1m'

# Define paths
SOURCE_FILE="motd.sh"
DEST_DIR="/etc/profile.d/"
MOTD_FILE="/etc/motd"
BASHRC_FILE=".bashrc"
ROOT_BASHRC="/root/.bashrc"

# Check if motd.sh exists
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo -e "${BOLD}${RED}✖ Error:${RESET} ${RED}Source file '${SOURCE_FILE}' not found!${RESET}"
    exit 1
fi

# Remove default LXC banner if present
if [[ -f "${DEST_DIR}00_lxc-details.sh" ]]; then
    if sudo rm -f "${DEST_DIR}00_lxc-details.sh"; then
        echo -e "${YELLOW}⚠ Removed default LXC banner: ${CYAN}00_lxc-details.sh${RESET}"
    else
        echo -e "${BOLD}${RED}✖ Failed to remove default LXC banner: ${CYAN}00_lxc-details.sh${RESET}"
    fi
fi


# Copy motd.sh
if sudo cp "$SOURCE_FILE" "$DEST_DIR"; then
    echo -e "${GREEN}✔ '${SOURCE_FILE}' has been copied to ${CYAN}${DEST_DIR}${RESET}"
else
    echo -e "${BOLD}${RED}✖ Failed to copy '${SOURCE_FILE}' to '${DEST_DIR}'${RESET}"
    exit 1
fi

# Clear /etc/motd
if sudo truncate -s 0 "$MOTD_FILE"; then
    echo -e "${GREEN}✔ Cleared contents of ${CYAN}${MOTD_FILE}${RESET}"
else
    echo -e "${BOLD}${RED}✖ Failed to clear '${MOTD_FILE}'${RESET}"
    exit 1
fi

# Check for .bashrc
if [[ ! -f "$BASHRC_FILE" ]]; then
    echo -e "${BOLD}${RED}✖ Error:${RESET} ${RED}No '${BASHRC_FILE}' found in the current directory!${RESET}"
    exit 1
fi

# Replace root's .bashrc
if sudo cp "$BASHRC_FILE" "$ROOT_BASHRC"; then
    echo -e "${GREEN}✔ Replaced ${CYAN}/root/.bashrc${RESET}"
else
    echo -e "${BOLD}${RED}✖ Failed to replace '${ROOT_BASHRC}'${RESET}"
    exit 1
fi

# Final message
echo -e "${BOLD}${GREEN}✔ Script completed successfully!${RESET}"
echo -e "${YELLOW}➤ To apply changes immediately, run: ${BOLD}${RED}source /root/.bashrc${RESET}"
