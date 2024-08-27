#!/bin/bash

#directory path as an argument.
if [ -z "$1" ]; then
    echo "Usage: $0 <dir_to_backup>"
    exit 1
fi

# assign directory to backup
TO_BACKUP=$1
# assign log file
LOG_FILE="/var/log/backup.log"


#check directory available
if [ ! -d "$TO_BACKUP" ]; then
    echo "Error: Directory $TO_BACKUP does not exist."
    exit 1
fi

# Stores the backup file in /var/backups with a timestamp & compressed tarball (.tar.gz) of the directory
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
BACKUP_FILE="/var/backups/backup_$TIMESTAMP.tar.gz"

# creating the backup file
tar -czf $BACKUP_FILE $TO_BACKUP


#Logs the backup operation to /var/log/backup.log with a timestamp.
if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup of $TO_BACKUP created at $BACKUP_FILE" | sudo tee -a $LOG_FILE
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup of $TO_BACKUP failed" | sudo tee -a $LOG_FILE
    exit 1
fi
