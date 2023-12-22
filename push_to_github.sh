#!/bin/bash

source config.sh

check_directory_exists

# Clone the GitHub repository to a temporary directory
git clone "$PUSH_GITHUB_REPO_URL" "$TEMP_DIR"

# Check if the clone was successful
if [ $? -eq 0 ]; then
    # Copy the local file to the temporary directory
    cp "$LOCAL_ZSH_FILE" "$TEMP_DIR"

    # Print the differences
    echo "Checking for differences:"

    # Check if there are changes
    if [ -n "$(git -C "$TEMP_DIR" status --porcelain)" ]; then
        # Replace the local .zshrc file with the one from the repository
        cp "$TEMP_DIR/$FILE_PATH" "$HOME/$FILE_PATH"
        echo "Successfully updated $FILE_PATH with the latest changes."

        # Commit and push changes to the GitHub repository
        cd "$TEMP_DIR" || exit
        git add .
        git commit -m "Update $LOCAL_ZSH_FILE"
        git push
        echo "Successfully pushed changes to $PUSH_GITHUB_REPO_URL."
    else
        echo "No changes found. Skipping update, commit, and push."
    fi
else
    echo "Error cloning repository from $PUSH_GITHUB_REPO_URL."
    exit 1
fi

# Clean up temporary directory
rm -rf "$TEMP_DIR"
