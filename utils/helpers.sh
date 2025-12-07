#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

log() {
    echo -e "${GREEN}[INFO]${RESET} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $1" >&2
    exit 1
}
