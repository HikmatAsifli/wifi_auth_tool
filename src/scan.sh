#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils/helpers.sh"
source "$SCRIPT_DIR/../config/config.sh"

scan_networks() {
    log "Scanning for WiFi networks on $INTERFACE ..."
    sudo iwlist "$INTERFACE" scan | grep "ESSID"
}

scan_networks
