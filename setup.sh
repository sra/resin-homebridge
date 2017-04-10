#!/usr/bin/env bash

WORKING_DIR="/usr/src/app"
HOMEBRIDGE_DIR="/data/.homebridge/"
KEEP_CONFIG=${KEEP_CONFIG:-no}

cd "$WORKING_DIR"

# Setup Homebridge
if [ -d "$HOMEBRIDGE_DIR" ]; then
    # Exists
    echo "Homebridge is already configured at \"$HOMEBRIDGE_DIR\"."
    if [ "$KEEP_CONFIG" = "yes" ]; then
      echo "KEEP_CONFIG=yes, Run \"Purge Data\" and then \"Reboot\" action to reset to default configuration."
    else
      echo "KEEP_CONFIG=no, Replacing $HOMEBRIDGE_DIR/config.json with .homebridge/config.json"
      cp .homebridge/config.json "$HOMEBRIDGE_DIR"
    fi
else
    # Does not exist
    echo "Homebridge is not configured."
    echo "Creating Homebridge directory at \"$HOMEBRIDGE_DIR\"."
    mkdir -p "$HOMEBRIDGE_DIR"
    echo "Copying Homebridge configuration"
    cp .homebridge/* "$HOMEBRIDGE_DIR"
fi
