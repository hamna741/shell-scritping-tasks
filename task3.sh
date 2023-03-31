#!/bin/bash
#Set report file location
report_file=/home/hamna/Desktop/myproject/report.txt


# CPU usage
cpu_usage=$(mpstat 1 1 | awk '/^Average/ {print 100 - $NF}')

# memory usage
memory_usage=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')

#  disk usage
disk_usage=$(df -h | awk '$NF=="/" {printf "%s", $5}')

# network statistics
rx_bytes=$(cat /proc/net/dev | awk '$1=="lo:" {print $2}')
tx_bytes=$(cat /proc/net/dev | awk '$1=="lo:" {print $10}')

# report
echo "System Usage Report" > $report_file
echo '' >> $report_file

echo "CPU Usage: $cpu_usage%" >> $report_file
echo "Memory Usage: $memory_usage%" >> $report_file
echo "Disk Usage: $disk_usage" >> $report_file
echo "Network Statistics:" >> $report_file
echo "- Received Bytes: $rx_bytes" >> $report_file
echo "- Transmitted Bytes: $tx_bytes" >> $report_file

