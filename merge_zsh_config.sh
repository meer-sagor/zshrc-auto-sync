#!/bin/bash

source github_config.sh

FILE_PATH=".zshrc"

echo "Checking for differences in $FILE_PATH between local and $PUSH_GITHUB_REPO_URL"

# Clone the GitHub repository to a temporary directory
temp_dir=$(dirname "$0")/tem

# Clone the GitHub repository to a temporary directory
git clone "$PUSH_GITHUB_REPO_URL" "$temp_dir"


# Check if the clone was successful
if [ $? -eq 0 ]; then
    # Check if FILE_PATH exists in the cloned repository
    if [ -e "$temp_dir/$FILE_PATH" ]; then
        # Check for differences using diff
        differences=$(diff "$HOME/$FILE_PATH" "$temp_dir/$FILE_PATH")

        if [ $? -eq 0 ]; then
            echo "No differences found. Skipping update."
        else
            # Replace the local .zshrc file with the one from the repository
            cp "$temp_dir/$FILE_PATH" "$HOME/$FILE_PATH"
            echo "Successfully updated $FILE_PATH with the latest changes."
        fi
    else
        echo "$FILE_PATH not found in the cloned repository. Skipping update."
    fi
else
    echo "Error cloning repository from $PUSH_GITHUB_REPO_URL."
fi

# Clean up temporary directory
rm -rf "$temp_dir"