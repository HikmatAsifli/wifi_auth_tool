#!/bin/bash

source ../config/config.sh

BSSID="$1"
CHANNEL="$2"

# Put network interface in monitor mode
sudo airmon-ng start $INTERFACE

# Capture handshake
sudo airodump-ng --bssid $BSSID --channel $CHANNEL --write "${CAPTURE_DIR}handshake" $INTERFACE

