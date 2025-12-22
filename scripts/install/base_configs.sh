#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/.dotfiles/scripts
# Base configs Directory
BASE_CONFIG_DIR="$ACTUAL_HOME"/.dotfiles/base
# Config Directory
CONFIG_DIR="$ACTUAL_HOME"/.config

source "$SCRIPTS_DIR"/script-beginer.sh

log_info "Copying Base configs"
cp -r "$BASE_CONFIG_DIR"/.gitconfig "$ACTUAL_HOME"/
cp -r "$BASE_CONFIG_DIR"/.zshenv "$ACTUAL_HOME"/
cp -r "$BASE_CONFIG_DIR"/.zshenv "$ACTUAL_HOME"/
cp -r "$BASE_CONFIG_DIR"/.config/* "$CONFIG_DIR"/
