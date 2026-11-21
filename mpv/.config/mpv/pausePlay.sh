#!/bin/bash

# Check if socket exists
if [ -e /tmp/mpvsocket ]; then
    printf '%s\n' '{ "command": ["cycle", "pause"] }' | /usr/bin/nc -w 1 -U /tmp/mpvsocket
else
    echo "MPV is not running or IPC is not set up."
fi
