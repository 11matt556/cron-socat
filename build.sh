#!/bin/sh

# What base image of Alpine to use for all builds
current_alpine_version=3.17.3

# Build standard cron image
docker build --build-arg alpine_version=$current_alpine_version --tag djpic/cron:$current_alpine_version-standard .
docker tag djpic/cron:$current_alpine_version-standard djpic/cron:latest

# Build default cron image
cd default
docker build --build-arg alpine_version=$current_alpine_version --tag djpic/cron:$current_alpine_version-default .
docker tag djpic/cron:$current_alpine_version-default djpic/cron:default

# Build development cron image
cd ../development/
docker build --build-arg alpine_version=$current_alpine_version --tag djpic/cron:$current_alpine_version-dev .
docker tag djpic/cron:$current_alpine_version-dev djpic/cron:dev

# Push images to Dockerhub
docker push djpic/cron:latest
docker push djpic/cron:dev
docker push djpic/cron:default
docker push djpic/cron:$current_alpine_version-standard
docker push djpic/cron:$current_alpine_version-default
docker push djpic/cron:$current_alpine_version-dev
