#!/bin/bash

source ../config/config.sh

# Function to enable monitor mode 
enable_monitor_mode() {
	sudo airmon-ng start $INTERFACE
}

# Function to disable monitor mode 
disable_monitor_mode() {
	sudo airmon-ng stop ${INTERFACE}mon
}
