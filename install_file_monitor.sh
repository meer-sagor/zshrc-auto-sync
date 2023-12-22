#!/bin/bash
# Check if inotify-tools is already installed
if command -v inotifywait &> /dev/null; then
    echo "inotify-tools is already installed. Skipping installation."
else
    # Ask the user if they want to install inotify-tools
    read -p "inotify-tools is not installed. Do you want to install it? (y/n): " choice
    if [ "$choice" == "y" ]; then
        sudo apt-get update
        sudo apt-get install -y inotify-tools
        echo "inotify-tools has been installed."
    else
        echo "Skipping inotify-tools installation."
    fi
fi