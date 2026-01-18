#!/bin/bash

# Checks the usage of disc acceptable by default/given percentage.
# Checks if given paramter number
# Saves the result in disc_check.log file

LOGFILE="$HOME/disc_check.log"
THRESHOLD=${1:-80}

if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]]; then
	echo "$(date): ERROR - Threshold is not a number: $THRESHOLD" >> "$LOGFILE"
	exit 2
fi 

usage=$(df -h /home | awk 'NR==2 {print $5}' | cut -d'%' -f1)

if [ "$usage" -gt "$THRESHOLD" ]; then
	echo "WARNING: Disk usage is critical! Over: $usage%"
	exit 1
else
	echo "Disk usage is normal: $usage% "
fi

echo "$(date): Disk usage OK: $usage%" >> "$LOGFILE"
