#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils/helpers.sh"
source "$SCRIPT_DIR/../utils/monitor_mode.sh"
source "$SCRIPT_DIR/../config/config.sh"

BSSID="$1"
CHANNEL="$2"

if [[ -z "$BSSID" || -z "$CHANNEL" ]]; then
    error "Usage: capture_handshake.sh <BSSID> <CHANNEL>"
fi

enable_monitor_mode

log "Capturing handshake for AP: $BSSID on channel $CHANNEL"
sudo airodump-ng --bssid "$BSSID" --channel "$CHANNEL" --write "${CAPTURE_DIR}handshake" "${INTERFACE}mon"
