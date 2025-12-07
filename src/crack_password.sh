#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils/helpers.sh"
source "$SCRIPT_DIR/../config/config.sh"

HANDSHAKE="$1"

if [[ -z "$HANDSHAKE" ]]; then
    error "Usage: crack_password.sh <handshake_file>"
fi

log "Cracking handshake using wordlist..."
sudo aircrack-ng "${CAPTURE_DIR}${HANDSHAKE}.cap" -w "$WORDLIST"
