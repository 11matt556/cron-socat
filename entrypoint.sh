#!/bin/sh

echo "Based on https://hub.docker.com/repository/docker/djpic/cron"
echo "For more information: https://github.com/11matt556/cron-socat"
echo "Starting Docker Container..."

crond -f -l 8 -d 8 -L /dev/stdout
