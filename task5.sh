#!/bin/bash
#Set log file to monitor
log_file=/home/hamna/Desktop/myproject/logfile.log

keyword="ERROR"


tail -f $log_file | while read line
do
  # Check if line contains keyword
  if echo $line | grep -q "ERROR\|WARNING"; then
    # Send email alert
    notify-send "Subject: ALERT" "CRTITCAL ERROR/WARNING IN: $log_file: $line"
    
  fi
done
