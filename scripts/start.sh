#!/bin/bash

# Install Extras
if [ ! -z "$DEBS" ]; then
 apt-get update
 apt-get install -y $DEBS
fi

# Dont pull code down if the .git folder exists
if [ -f "/usr/src/app/package.json" ];then
  # Code present, start service
  cd /usr/src/app
  # Run any commands passed by env
  eval $STARTUP_COMMANDS
  # Start!
  npm start
fi
