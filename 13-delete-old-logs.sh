#!/bin/bash
APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F-%H-%M-%S)  
LOGSDIR="/home/centos/shellscript-logs"
SCRIPT_NAME=$(basename "$0")
LOGFILE="$LOGSDIR/${SCRIPT_NAME}-${DATE}.log"
Files_to_delete=$(find $APP_LOGS_DIR -name   "*.log" -type f -mtime +14)
echo "script started executing at $DATE" &>>$LOGFILE

while read line

do 
    echo "deleting $line" &>>$LOGFILE
    rm -rf $line
done <<< $Files_to_delete



