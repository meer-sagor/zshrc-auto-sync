GITHUB_USERNAME="meer-sagor"
GITHUB_REPO="zsh-config"
CHECK_REPO_URL="https://api.github.com/repos/$GITHUB_USERNAME/$GITHUB_REPO"
# Use SSH URL for push
PUSH_GITHUB_REPO_URL="git@github.com:$GITHUB_USERNAME/$GITHUB_REPO.git"

FILE_PATH=".zshrc"
# Local file path to copy
LOCAL_ZSH_FILE="$HOME/$FILE_PATH"

# Where is your tem directory located
DIRECTORY_PATH="MeerSagor/Other-repo/zshrc-auto-sync"

# temporary directory
TEMP_DIR=$HOME/$DIRECTORY_PATH/tem

# Function to check if the last command was successful
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error: The last command failed. Exiting."
        exit 1
    fi
}

check_directory_exists() {
    if [ -d "$TEMP_DIR" ]; then
        # If it exists, remove its contents
        echo "Cleaning up existing temporary directory..."
        rm -rf "$TEMP_DIR"
    else
        # If it doesn't exist, create the directory
        mkdir -p "$TEMP_DIR"
    fi
}
