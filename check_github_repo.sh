#!/bin/bash

source config.sh

check_github_repo() {
    response=$(curl -s -o /dev/null -w "%{http_code}" "$CHECK_REPO_URL")

    if [ "$response" -eq 200 ]; then
        echo "Repository $GITHUB_USERNAME/$GITHUB_REPO exists on GitHub."
    elif [ "$response" -eq 404 ]; then
        echo "Repository $GITHUB_USERNAME/$GITHUB_REPO does not exist on GitHub."
    else
        echo "Unexpected response from GitHub API: $response"
    fi
}

# Call the function with the default or provided values
check_github_repo
