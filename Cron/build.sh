#!/bin/bash

# build standard cron image
docker rmi djpic/cron:latest
docker build --tag djpic/cron:standard .
docker tag djpic/cron:standard djpic/cron:latest
docker push djpic/cron:latest
docker push djpic/cron:standard


# build default cron image
cd default
docker rmi djpic/cron:default
docker build --tag djpic/cron:default .
docker push djpic/cron:default


# remove images
docker rmi djpic/cron:default
docker rmi djpic/cron:standard
docker rmi djpic/cron:latest