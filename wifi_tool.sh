#!/bin/bash

source ./utils/helpers.sh
source ./config/config.sh

# Show help message
show_help() {
    echo "Usage: ./wifi_tool.sh [options]"
    echo "Options:"
    echo "  -s               Scan for available networks"
    echo "  -c SSID PASS     Connect to a WiFi network"
    echo "  -p BSSID CHAN    Capture WPA/WPA2 handshake"
    echo "  -d BSSID         Deauthenticate clients from AP"
    echo "  -k HANDSHAKE     Crack captured handshake with wordlist"
    echo "  -h               Show this help message"
}

# Parse options
while getopts ":sc:p:d:k:h" opt; do
    case ${opt} in
        s ) ./src/scan.sh ;;
        c ) ./src/connect.sh "$OPTARG" ;;
        p ) ./src/capture_handshake.sh "$OPTARG" ;;
        d ) ./src/deauth.sh "$OPTARG" ;;
        k ) ./src/crack_password.sh "$OPTARG" ;;
        h ) show_help ;;
        \? ) echo "Invalid option: -$OPTARG" >&2; show_help; exit 1 ;;
    esac
done

