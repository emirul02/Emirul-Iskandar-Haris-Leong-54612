#!/bin/bash

#set the threshold which is minimum value to be notified (80 percent for this alert)
#set lower which is 10 percent for testing purpose
THRESHOLD=10

#set the email to be notified
EMAIL="emirul@gmail.com"
# getting the disk usage value, only get the numerical value for comparing purpose
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

# comparing the disk usage value
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
#above threshold
echo "Warning: The disk usage of the root filesystem has reached ${DISK_USAGE}%."

#  Prepare the email body
SUBJECT="Disk Usage Alert: Root Filesystem"
    BODY="Warning: The disk usage of the root filesystem has reached ${DISK_USAGE}%."
#send the email  using mail
    echo "$BODY" | mail -s "$SUBJECT" "$EMAIL"

#below threshold
else
echo "The disk usage is below 80%"
fi

# set this script to run under cron job, run every 30 minutes or 1 hour to monitor a machine's disk usage
