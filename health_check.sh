#!/bin/bash

# Date and time
echo "=== Health Check Report: $(date '+%Y-%m-%d %H:%M:%S') ==="

# CPU load
echo -e "\n>> CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'

# Memory usage
echo -e "\n>> Memory Usage:"
free -h | grep Mem | awk '{printf "Used: %s / %s (%.2f%%)\n", $3, $2, $3*100/$2}'

# Disk usage
echo -e "\n>> Disk Usage:"
df -h / | awk 'NR==2 {print "Used: " $3 " / " $2 " (" $5 ")"}'

# Top 5 RAM-consuming processes
echo -e "\n>> Top 5 Processes by RAM Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Uptime
echo -e "\n>> System Uptime:"
uptime -p

# Separator
echo -e "\n============================================\n"