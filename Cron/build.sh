#!/bin/sh

# What base image of Alpine to use for all builds
current_alpine_version=3.14.6

# Build standard cron image
docker build --build-arg alpine_version=$current_alpine_version --tag djpic/cron:$current_alpine_version-standard .
docker tag djpic/cron:$current_alpine_version-standard djpic/cron:latest

# Build default cron image
cd default
docker build --build-arg alpine_version=$current_alpine_version --tag djpic/cron:$current_alpine_version-default .

# Push images to Dockerhub
docker push djpic/cron:latest
docker push djpic/cron:$current_alpine_version-standard
docker push djpic/cron:$current_alpine_version-default
