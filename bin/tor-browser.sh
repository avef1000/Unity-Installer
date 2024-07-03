#!/bin/bash

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to print a message with a specific color
print_message() {
    local color=$1
    shift
    echo -e "${color}${BOLD}$@${NC}"
}

# Tor Browser Installer
install_tor_browser() {
    print_message $BLUE "||====================TOR BROWSER==========================||"
    print_message $YELLOW ""
    print_message $GREEN "        Installation script by Avraham Freeman"
    print_message $YELLOW ""
    print_message $BLUE "||=========================================================||"
    sleep 1
    print_message $YELLOW " Just a quick update first"
    sleep 2
    sudo apt update
    sleep 1
    print_message $YELLOW "Upgrading system"
    sleep 1
    sudo apt upgrade -y
    sleep 1
    sudo apt install -y tor torbrowser-launcher
    print_message $GREEN "Installation successful! Let's give it a go"
    print_message $YELLOW " TO LAUNCH TOR BROWSER TYPE $ torbrowser-launcher or go in applications"
    sleep 3
    if [ "$1" != "install_only" ]; then
        torbrowser-launcher
    fi
    exit 0
}
