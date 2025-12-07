#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils/helpers.sh"
source "$SCRIPT_DIR/../config/config.sh"

SSID="$1"
PASSWORD="$2"

if [[ -z "$SSID" || -z "$PASSWORD" ]]; then
    error "Usage: connect.sh <SSID> <PASSWORD>"
fi

log "Connecting to WiFi: $SSID"
nmcli dev wifi connect "$SSID" password "$PASSWORD"
