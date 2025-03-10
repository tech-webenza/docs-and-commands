#!/bin/bash

# Set threshold
THRESHOLD=90
EMAIL="your_email@example.com"
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
HOSTNAME=$(hostname)

# Get disk usage percentage for root (/) partition
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    MESSAGE="Warning: Disk usage on EC2 Instance ($INSTANCE_ID - $HOSTNAME) has reached ${USAGE}%."
    echo -e "Subject: EC2 Disk Space Alert\n\n$MESSAGE" | mail -s "EC2 Disk Space Alert - $INSTANCE_ID" $EMAIL
fi
