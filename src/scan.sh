#!/bin/bash

# Get the current directory where the script is running
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../config/config.sh"

# Function to scan for WiFi networks
scan_networks() {
    echo "Scanning for WiFi networks..."
    sudo iwlist $INTERFACE scan | grep 'ESSID'
}

scan_networks
