#!/bin/bash

# Source configuration
source config.sh

# Run the script in the background using nohup and &
nohup /bin/bash -c "cd \$HOME/$DIRECTORY_PATH && ./watch_and_push.sh" &

# Print a message indicating that the script is running in the background
echo "The script is running in the background."