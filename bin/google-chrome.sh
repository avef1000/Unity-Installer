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

# Google Chrome Installer
install_google_chrome() {
    print_message $BLUE "################################################################################"
    print_message $GREEN "========================= Chrome Installer Script ================================"
    print_message $YELLOW "+++++++++++++++++++++ Written by Avraham Freeman ++++++++++++++++++++++++++++++++"
    print_message $BLUE " Once"
    sleep 1
    print_message $BLUE "      Upon"
    sleep 1
    print_message $BLUE "           A Time"
    sleep 1
    print_message $YELLOW " We begin by updating your system"
    print_message $RED "Please grant root access"
    sudo apt update
    print_message $GREEN "Congrats! Our system is updated"
    sleep 1
    print_message $YELLOW "Beginning upgrading process"
    sudo apt upgrade -y
    print_message $GREEN "Upgrade is complete"
    print_message $YELLOW "Installing dependencies"
    sleep 1
    sudo apt install -y wget
    print_message $GREEN "Dependencies resolved"
    print_message $BLUE "You rock, keep it going"
    sleep 1
    print_message $YELLOW "Downloading source code package"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    print_message $GREEN "Received package google-chrome-stable_current_amd64.deb"
    print_message $YELLOW "Configuring package"
    sleep 1
    print_message $YELLOW "Installing package system-wide"
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    print_message $GREEN "Installation success! Congrats"
    sudo rm -r ./google-chrome-stable_current_amd64.deb
    sleep 1
    if [ "$1" != "install_only" ]; then
        print_message $RED "IMPORTANT: TO ACCESS GOOGLE CHROME PLEASE TYPE IN THE CLI >google-chrome"
        print_message $RED "OR FIND IT IN THE APPLICATIONS BOX IN THE TOP LEFT CORNER (PER YOUR DISTRO)"
        sleep 3
        print_message $YELLOW "Let's take Chrome for a run"
        print_message $BLUE "Initializing"
        sleep 1
        google-chrome --no-sandbox
    fi
    exit 0
}
