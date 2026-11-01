#!/bin/bash

# Check if socket exists
if [ -e /tmp/mpvsocket ]; then
    echo '{ "command": ["cycle", "pause"] }' | /opt/homebrew/bin/socat - /tmp/mpvsocket
else
    echo "MPV is not running or IPC is not set up."
fi
