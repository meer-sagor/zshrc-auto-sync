#!/bin/bash

# Define the GitHub repository URL and local file path
GITHUB_USER="meer-sagor"
GITHUB_REPO="zshrc-auto-sync"
#ACCESS_TOKEN="your-access-token"
GITHUB_REPO="https://github.com/$GITHUB_USER/$GITHUB_REPO.git"
FILE_PATH=".zshrc"

echo "Downloading latest .zshrc from $GITHUB_REPO"

# Clone the GitHub repository to a temporary directory
temp_dir=$(dirname "$0")/tem

#This if for public repo
git clone $GITHUB_REPO "$temp_dir"

#this is for private repo
#git clone "https://$GITHUB_USER:$ACCESS_TOKEN@github.com/$GITHUB_USER/$GITHUB_REPO.git" "$temp_dir"

# Check if the clone was successful
# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
    # Replace the local .zshrc file with the one from the repository
    cp "$temp_dir/$FILE_PATH" "$HOME/$FILE_PATH"
    echo "Successfully updated $FILE_PATH with the latest changes."
else
    echo "Error cloning repository from $GITHUB_REPO."
fi

# Clean up temporary directory
rm -rf "$temp_dir"