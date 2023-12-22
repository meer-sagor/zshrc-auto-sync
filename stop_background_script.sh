#!/bin/bash

# Find the process ID of the script using pgrep
pid=$(pgrep -f "watch_and_push.sh")

# Send a termination signal to the identified PID
kill "$pid"

# Print a message indicating that the script has been stopped
echo "The script has been stopped."
