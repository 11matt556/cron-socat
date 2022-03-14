#!/bin/sh

# Build standard cron image
docker build --tag djpic/cron:standard .
docker tag djpic/cron:standard djpic/cron:latest

# Build default cron image
cd default
docker build --tag djpic/cron:default .

# Push images to Dockerhub
docker push djpic/cron:latest
docker push djpic/cron:standard
docker push djpic/cron:default
