#!/bin/bash

FILE_PATH=".zshrc"
LOCAL_ZSH_FILE="$HOME/$FILE_PATH"

while inotifywait -e modify "$LOCAL_ZSH_FILE"; do
    ./push_to_github.sh
done