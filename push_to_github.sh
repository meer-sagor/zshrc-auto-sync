#!/bin/bash

source github_config.sh

# FILE_PATH=".zshrc"
# # shellcheck disable=SC2046
# cd `dirname "$0"`

# cp "$HOME/$FILE_PATH" .

# git add .

# git commit -m "Sync zsh configs"

# git push origin

# GitHub repository information

# Local file path to copy
FILE_PATH=".zshrc"
LOCAL_ZSH_FILE="$HOME/$FILE_PATH"

# Temporary directory for cloning
temp_dir=$(mktemp -d)

# Clone the GitHub repository to a temporary directory

git clone "$PUSH_GITHUB_REPO_URL" "$temp_dir"

# Check if the clone was successful
if [ $? -eq 0 ]; then
    # Copy the local file to the temporary directory
    cp "$LOCAL_ZSH_FILE" "$temp_dir"

    # Commit and push changes to the GitHub repository
    cd "$temp_dir"
    git add .
    git commit -m "Update $LOCAL_ZSH_FILE"

    git push

    echo "Successfully pushed changes to $PUSH_GITHUB_REPO_URL."
else
    echo "Error cloning repository from $PUSH_GITHUB_REPO_URL."
fi

# Clean up temporary directory
rm -rf "$temp_dir"
