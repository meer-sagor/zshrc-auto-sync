#!/bin/bash

# Default GitHub username and repository name
DEFAULT_USERNAME="meer-sagor"
DEFAULT_REPO="wallet-system"

check_github_repo() {
    username=${1:-$DEFAULT_USERNAME}
    repository=${2:-$DEFAULT_REPO}
    api_url="https://api.github.com/repos/$username/$repository"

    response=$(curl -s -o /dev/null -w "%{http_code}" "$api_url")

    if [ "$response" -eq 200 ]; then
        echo "Repository $username/$repository exists on GitHub."
    elif [ "$response" -eq 404 ]; then
        echo "Repository $username/$repository does not exist on GitHub."
    else
        echo "Unexpected response from GitHub API: $response"
    fi
}

# Call the function with the default or provided values
check_github_repo "$1" "$2"
