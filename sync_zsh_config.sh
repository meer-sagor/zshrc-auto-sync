#!/bin/bash

source config.sh

./install.sh
check_success

./check_github_repo.sh
check_success

./merge_zsh_config.sh
check_success

./push_to_github.sh
check_success

./install_file_monitor.sh
check_success

# Run in the background to watch for changes
./watch_and_push.sh
