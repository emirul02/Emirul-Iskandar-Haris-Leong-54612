#!/bin/bash

PROCESS="apache2"
LOG_FILE="/var/log/process_monitor.log"

if pgrep -x "$PROCESS" > /dev/null
then
    echo "$PROCESS is running."
else
    sudo systemctl start $PROCESS
    echo "$PROCESS is not running. Start $PROCESS"
echo "$(date '+%Y-%m-%d %H:%M:%S') - $PROCESS was not running.$PROCESS restart using bash script" | sudo tee -a $LOG_FILE
fi

