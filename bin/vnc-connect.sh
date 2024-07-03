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

# VNC Viewer Installer
install_vnc_connect() {
    print_message $RED "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    print_message $RED "@  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -@"
    print_message $RED "@-- -- -- -- -- -- --RealVNC Viewer -- -- -- -- -- -- -- -- -- -@"
    print_message $RED "@ -- -- -- -- --Script by Avraham Freeman-- -- -- -- -- -- -- --@"
    print_message $RED "@-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- @"
    print_message $RED "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    sleep 3
    print_message $YELLOW " Updating system once more"
    sudo apt update
    print_message $YELLOW "Initializing and retrieving software, please wait.."
    print_message $YELLOW "[0..                100]"
    sleep 1
    print_message $YELLOW "  10..              100]"
    sleep 1
    print_message $YELLOW "    20..            100]"
    sleep 1
    print_message $YELLOW "      30..          100]"
    sleep 1
    print_message $YELLOW "        40..        100]"
    print_message $YELLOW "            ........100]"
    print_message $YELLOW "Creating tmp directory"
    mkdir tmp
    cd tmp
    wget https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-7.12.0-Linux-x64.deb
    print_message $GREEN "Download successful!"
    sleep 1
    print_message $YELLOW "Installing, please wait"
    sudo apt install -y ./VNC-Viewer-7.12.0-Linux-x64.deb
    print_message $GREEN "Installation was a success!"
    sudo rm -r ./VNC-Viewer-7.12.0-Linux-x64.deb
    cd ..
    sudo rm -r tmp
    if [ "$1" != "install_only" ]; then
        print_message $YELLOW " TO RUN, TYPE IN APPLICATION MENU, REALVNC"
    fi
    exit 0
}
