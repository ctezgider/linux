#/!bin/bash

# Checks the using of disk and

THRESHOLD=80

usage=$(df -h /home | awk 'NR==2 {print $5}' | cut -d'%' -f1)

if [ "$usage" -gt "$THRESHOLD" ]; then
	echo "WARNING: Disk usage is critical! Over: $usage%"
	exit 1
else
	echo "Disk usage is normal: $usage% "
fi
