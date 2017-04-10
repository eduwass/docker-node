#!/bin/bash

# Install Extras
if [ ! -z "$DEBS" ]; then
 apt-get update
 apt-get install -y $DEBS
fi

until [ -f /usr/src/app/package.json ]
do
  sleep 300 # 5 minutes
done

echo "package.json found"
# Code present, start service
cd /usr/src/app
# Run any commands passed by env
eval $STARTUP_COMMANDS
# Start!
npm start
