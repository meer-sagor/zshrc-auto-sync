#!/bin/bash

./install.sh
./check_github_repo.sh
./merge_zsh_config.sh
./push_zsh_config.sh
./install_file_monitor.sh

# Run in the background to watch for changes
# ./watch_and_push.sh
