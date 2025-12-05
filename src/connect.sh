#!/bin/bash

source ../config/config.sh

SSID="$1"
PASSWORD="$2"

# Function to connect to WiFi network
connect_network() {
	echo "Connect to $SSID..."
	nmcli dev wifi connect "$SSID" password "$PASSWORD"
}

connect_network
