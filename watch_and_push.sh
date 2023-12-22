#!/bin/bash

source config.sh

SCRIPT_PATH="./push_to_github.sh"  # Adjust the path if needed

if [ -x "$SCRIPT_PATH" ]; then
    echo "Watching $LOCAL_ZSH_FILE for changes..."
    
    # Run the script once
    "$SCRIPT_PATH"
    
    # Loop indefinitely to watch for changes
    while true; do
        inotifywait -e modify "$LOCAL_ZSH_FILE"
        echo "Detected modification. Running $SCRIPT_PATH"
        "$SCRIPT_PATH"
    done
else
    echo "Error: Script $SCRIPT_PATH is not executable."
fi