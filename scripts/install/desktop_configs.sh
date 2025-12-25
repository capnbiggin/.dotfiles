#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/git_repos/capndot/scripts
# Base configs Directory
DESKTOP_CONFIG_DIR="$ACTUAL_HOME"/git_repos/capndot/configs
# Config Directory
CONFIG_DIR="$ACTUAL_HOME"/.config

source "$SCRIPTS_DIR"/script-beginer.sh

log_info "Copying Desktop configs"

cp -r "$DESKTOP_CONFIG_DIR"/.config/* "$CONFIG_DIR"/
