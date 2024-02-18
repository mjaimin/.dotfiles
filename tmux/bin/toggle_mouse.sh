#!/bin/bash

# Check if inside a tmux session
if [ -z "$TMUX" ]; then
    echo "You must be in a tmux session to toggle mouse mode."
    exit 1
fi

# Get the current status of tmux's mouse mode
mouse_mode=$(tmux show -g | grep mouse | cut -d ' ' -f2)

# Toggle the mouse mode
if [ "$mouse_mode" = "on" ]; then
    tmux set -g mouse off
    echo "Mouse mode turned off."
else
    tmux set -g mouse on
    echo "Mouse mode turned on."
fi