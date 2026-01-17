#!/bin/bash

# Simple system update script

echo "System is updated..."

sudo apt update
if [ $? -ne 0 ]; then
    echo "apt update failed."
    exit 1
fi

sudo apt upgrade -y
if [ $? -ne 0 ]; then
    echo "apt upgrade failed."
    exit 1
fi

echo "Update completed."
