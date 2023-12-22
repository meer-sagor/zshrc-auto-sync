#!/bin/bash

source config.sh

echo "Checking for differences in $FILE_PATH between local and $PUSH_GITHUB_REPO_URL"

# Clone the GitHub repository to a temporary directory
if [ -d "$TEMP_DIR/.git" ]; then
    # If it's a Git repository, perform a clean to avoid issues
    echo "Cleaning up existing Git repository..."
    git -C "$TEMP_DIR" clean -dfx
else
    # If it's not a Git repository, remove its contents
    check_directory_exists

    # Clone the GitHub repository to a temporary directory
    git clone "$PUSH_GITHUB_REPO_URL" "$TEMP_DIR"

    # Check if the clone was successful
    if [ $? -ne 0 ]; then
        echo "Error cloning repository from $PUSH_GITHUB_REPO_URL."
        # Clean up temporary directory
        rm -rf "$TEMP_DIR"
        exit 1
    fi
fi

# Check if FILE_PATH exists in the cloned repository
if [ -e "$TEMP_DIR/$FILE_PATH" ]; then
    # Check for differences using diff
    differences=$(diff "$HOME/$FILE_PATH" "$TEMP_DIR/$FILE_PATH")

    if [ $? -eq 0 ]; then
        echo "No differences found. Skipping update."
    else
        # Replace the local .zshrc file with the one from the repository
        cp "$TEMP_DIR/$FILE_PATH" "$HOME/$FILE_PATH"
        echo "Successfully updated $FILE_PATH with the latest changes."
    fi
else
    echo "$FILE_PATH not found in the cloned repository. Skipping update."
fi

# Clean up temporary directory
rm -rf "$TEMP_DIR"
