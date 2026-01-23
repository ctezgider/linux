#!/bin/bash
# Shows disk, RAM and CPU usage at the same time

echo "Disk:"
df -h | awk '$1 ~ /^\/dev/ {print}'

echo -e "\nRAM:"
free -h

echo -e "\nCPU"
uptime
