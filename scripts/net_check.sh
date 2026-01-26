#!/bin/bash
# Checks internet connection, if fails restart NetworkManager
# Writes the result in log file
# Log file: ~/net_check.log

LOGFILE="$HOME/net_check.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")
TARGET="8.8.8.8" # google DNS

ping -c 2 -W 2 $TARGET > /dev/null 2>&1

if [ $? -eq 0 ]; then
   echo "$DATE - OK: Internet connection is up" >> "$LOGFILE"
else
   echo "$DATE - ERROR: No internet connection" >> "$LOGFILE"
   systemctl restart NetworkManager 2>/dev/null
   sleep 5
   ping -c 2 -W 2 $TARGET > /dev/null 2>&1

   if [ $? -eq 0 ]; then
	echo "$DATE - INFO: Network recovered after restart" >> "$LOGFILE"
   else
	echo "$DATE - FAIL: Network still down" >> "$LOGFILE"
   fi
fi

