#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"
source "$SCRIPT_DIR/../config/config.sh"

enable_monitor_mode() {
    log "Enabling monitor mode on $INTERFACE"
    sudo airmon-ng start "$INTERFACE"
}

disable_monitor_mode() {
    log "Disabling monitor mode"
    if [[ -d /sys/class/net/${INTERFACE}mon ]]; then
        sudo airmon-ng stop "${INTERFACE}mon"
    else
        sudo airmon-ng stop "$INTERFACE"
    fi
}
