#!/bin/bash

source ../config/config.sh

HANDSHAKE_FILE="$1"

# Crack WPA/WPA2 password using wordlist
sudo aircrack-ng "${CAPTURE_DIR}${HANDSHAKE_FILE}.cap" -w $WORDLIST
