#!/usr/bin/env bash

# Set Actual Home
ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# Script Directory
SCRIPTS_DIR="$ACTUAL_HOME"/.dotfiles/scripts

set -eu

# Set your terminal:
TERM="ghostty"

# Directories
REPO="$ACTUAL_HOME/git_repos"
MY_BRAIN="$ACTUAL_HOME/Documents/My-Brain"

# Pick repo
configs="$(find "$REPO"/*/ -maxdepth 0 -print0 | xargs -0 -n1 basename)"
[ -n "$configs" ] || exit 0
#scripts="$(basename "$SCRIPTS_DIR")"
#[ -n "$scripts" ] || exit 0
#brain="$(basename "$MY_BRAIN")"
#[ -n "$brain" ] || exit 0
chosen="$(printf '%s\n' "$configs" |
  rofi -dmenu -p 'Projects:')"
[ -n "$chosen" ] || exit 0
if [[ "$chosen" == "scripts" ]]; then
  dir="$SCRIPTS_DIR"
elif [[ "$chosen" == "My-Brain" ]]; then
  dir="$MY_BRAIN"
else
  dir="$REPO/$chosen"
fi

# Nuke any existing terminal (since you only use one terminal)
# pkill -x $terminal 2>/dev/null || true
# sleep 0.1

# Launch a clean terminal: attach if exists, else create
exec $TERM -e tmux new-session -As "$chosen" -c "$dir"
