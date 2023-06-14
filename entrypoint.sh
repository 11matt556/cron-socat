#!/bin/sh

echo "Based on https://hub.docker.com/repository/docker/djpic/cron"
echo "Starting DockerContainer..."

crond -f -l 8 -d 8 -L /dev/stdout
