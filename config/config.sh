#!/bin/bash

# Auto-detect OS (macOS-də airmon-ng yoxdur)
OS=$(uname)
if [[ "$OS" == "Darwin" ]]; then
    echo "[ERROR] macOS WiFi pentesting tools do not support monitor mode (airmon-ng, iwlist, airodump-ng)."
    echo "Please use Linux (Kali, Ubuntu, Parrot, etc.)"
    exit 1
fi

# Try to detect interface
INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}' | head -n 1)

if [[ -z "$INTERFACE" ]]; then
    echo "[ERROR] No wireless interface detected!"
    exit 1
fi

CAPTURE_DIR="./capture/"
WORDLIST="./wordlists/wordlist.txt"
