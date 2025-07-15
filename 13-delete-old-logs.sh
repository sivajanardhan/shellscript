#!/bin/bash

APP_LOGS_DIR="/home/centos/app-logs"
DATE=$(date +%F-%H-%M-%S)
LOGSDIR="/home/centos/shellscript-logs"
SCRIPT_NAME=$(basename "$0")
LOGFILE="${LOGSDIR}/${SCRIPT_NAME}-${DATE}.log"

# Create log directory if it doesn't exist
mkdir -p "$LOGSDIR"

echo "Script started executing at $DATE" >> "$LOGFILE"

files_to_delete=$(find "$APP_LOGS_DIR" -name "*.log" -type f -mtime +14)

while IFS= read -r line; do 
    echo "Deleting $line" >> "$LOGFILE"
    rm -rf "$line"
done <<< "$files_to_delete"

echo "Script finished at $(date +%F-%H-%M-%S)" >> "$LOGFILE"
