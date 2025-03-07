#!/bin/bash

# Colors
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
RED='\e[31m'
NC='\e[0m' # No color

# System info
HOSTNAME=$(hostname)
OS_NAME=$(cat /etc/os-release | grep '^PRETTY_NAME=' | cut -d'=' -f2 | tr -d '"')
KERNEL=$(uname -r)
ARCH=$(uname -m)
IP=$(hostname -I | awk '{print $1}')
UPTIME=$(uptime -p)
LOAD=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
MEMORY=$(free -h | grep Mem: | awk '{print $3 "/" $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')

# Fancy output
echo -e "${CYAN}=============================================================${NC}"
echo -e "${GREEN}    🐧  Welcome to your $HOSTNAME 🐧${NC}"
echo -e "${CYAN}=============================================================${NC}"
echo -e "${YELLOW}🌐  Hostname: ${NC}${GREEN}$HOSTNAME${NC}"
echo -e "${YELLOW}💻  OS: ${NC}${GREEN}$OS_NAME${NC}"
echo -e "${YELLOW}🧠  Kernel: ${NC}${GREEN}$KERNEL${NC}"
echo -e "${YELLOW}📡  IP Address: ${NC}${GREEN}$IP${NC}"
echo -e "${YELLOW}🗂️  Memory Usage: ${NC}${GREEN}$MEMORY${NC}"
echo -e "${YELLOW}💾  Disk Usage: ${NC}${GREEN}$DISK${NC}"
echo -e "${YELLOW}⏳  Uptime: ${NC}${GREEN}$UPTIME${NC}"
echo -e "${CYAN}=============================================================${NC}"
