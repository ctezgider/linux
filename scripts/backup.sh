#!/bin/bash

set -e

SOURCE="$HOME/Documents"
BACKUP_DIR="$HOME/backups"
LOGFILE="$HOME/backup.log"
DATE=$(date "+%Y-%m-%d_%H-%M-%S")

tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE" \ && echo "$DATE - Backup created successfully" || "$LOGFILE"
