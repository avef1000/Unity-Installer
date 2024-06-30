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

# VS Code Installer
install_vscode() {
    print_message $BLUE "============================================================"
    print_message $GREEN "======================= VS Code Installer ==================="
    print_message $YELLOW "+++++++++++++++ Written by Avraham Freeman ++++++++++++++++++"
    print_message $BLUE "============================================================"
    sudo apt update
    sudo apt install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update
    sudo apt install -y code
    rm -f packages.microsoft.gpg
    print_message $GREEN "VS Code installation successful!"
    if [ "$1" != "install_only" ]; then
        code
    fi
    exit 0
}

# Git Installer
install_git() {
    print_message $BLUE "============================================================"
    print_message $GREEN "======================== Git Installer ======================"
    print_message $YELLOW "+++++++++++++++ Written by Avraham Freeman ++++++++++++++++++"
    print_message $BLUE "============================================================"
    sudo apt update
    sudo apt install -y git
    print_message $GREEN "Git installation successful!"
    exit 0
}

# Docker Installer
install_docker() {
    print_message $BLUE "============================================================"
    print_message $GREEN "====================== Docker Installer ====================="
    print_message $YELLOW "+++++++++++++++ Written by Avraham Freeman ++++++++++++++++++"
    print_message $BLUE "============================================================"
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    print_message $GREEN "Docker installation successful! You may need to log out and log back in for the changes to take effect."
    exit 0
}

#zoom installation
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "******************* Zoom 
echo "
echo "
echo "
echo "



# Function to display menu
display_menu() {
    print_message $BLUE "||==========Unity Installer==========||"
    print_message $YELLOW "  Which would you like to install?"
    print_message $YELLOW "1. Google Chrome"
    print_message $YELLOW "2. Tor Browser"
    print_message $YELLOW "3. VNC Connect/Viewer"
    print_message $YELLOW "4. VS Code"
    print_message $YELLOW "5. Git"
    print_message $YELLOW "6. Docker"
    print_message $YELLOW "7. Zoom"
    print_message $YELLOW "8. All"
    print_message $YELLOW "9. Exit :( "
    print_message $BLUE "======================================"
    read -p "Enter your choice: " choice
    case $choice in
        1) install_google_chrome ;;
        2) install_tor_browser ;;
        3) install_vnc_connect ;;
        4) install_vscode ;;
        5) install_git ;;
        6) install_docker ;;
        7) install_zoom ;;
        8) install_google_chrome install_only; install_tor_browser install_only; install_vnc_connect install_only; install_vscode install_only; install_git install_only; install_docker install_only ;;
        9) exit 0 ;;
        *) echo "Invalid choice, please select a valid option"
           display_menu ;;
    esac
}

# Main script execution
display_menu
