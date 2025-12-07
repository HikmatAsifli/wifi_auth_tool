#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils/helpers.sh"
source "$SCRIPT_DIR/config/config.sh"

show_help() {
    echo "Usage: ./wifi_tool.sh [options]"
    echo
    echo "  -s                 Scan WiFi networks"
    echo "  -c SSID PASS       Connect to WiFi"
    echo "  -p BSSID CHAN      Capture WPA/WPA2 handshake"
    echo "  -d BSSID           Deauth clients"
    echo "  -k FILE            Crack handshake"
    echo "  -h                 Help"
}

if [[ $# -eq 0 ]]; then
    show_help
    exit 0
fi

case "$1" in
    -s)
        ./src/scan.sh
        ;;
    -c)
        ./src/connect.sh "$2" "$3"
        ;;
    -p)
        ./src/capture_handshake.sh "$2" "$3"
        ;;
    -d)
        ./src/deauth.sh "$2"
        ;;
    -k)
        ./src/crack_password.sh "$2"
        ;;
    -h)
        show_help
        ;;
    *)
        error "Invalid command"
        ;;
esac
