[![Publish Docker Image](https://github.com/11matt556/socat-cron/actions/workflows/publish.yml/badge.svg?event=release)](https://github.com/11matt556/socat-cron/actions/workflows/publish.yml)
[![Push changes to Gitlab](https://github.com/11matt556/socat-cron/actions/workflows/gitlab-push.yml/badge.svg?event=push)](https://github.com/11matt556/socat-cron/actions/workflows/gitlab-push.yml)

# cron-socat
Forked from djpic's [docker-images](https://gitlab.com/djpic/docker-images) project on Gitlab. 

Removed non-cron items, modified to use alpine/socat instead of alpine, removed fastcgi, and switched CI/CD to Github Actions. 

My purpose for this is as a simple scheduler for docker container actions without Docker Swarm or k8s. The idea is to pass through docker.sock and communicate with the socket with socat to control containers on the host. 

## Source Repo
* [Github](https://github.com/11matt556/cron-socat)
* [Gitlab (mirror)](https://gitlab.com/11matt556/cron-socat)

## Docker Image
* [GHCR](https://github.com/11matt556/socat-cron/pkgs/container/cron-socat)
* [Dockerhub](https://hub.docker.com/r/11matt556/cron-socat) 

# How to use
Mount script(s) into the directories below to run them at the associated interval:

* /etc/periodic/1min/
* /etc/periodic/15min/
* /etc/periodic/30min/
* /etc/periodic/hourly/
* /etc/periodic/12hour/
* /etc/periodic/daily/
* /etc/periodic/weekly/
* /etc/periodic/monthly/

See `crontab` file for details on the exact schedule for each associated folder.

## docker-compose example
```
version: "3.2"
services:
  cron:
    image: 11matt556/cron-socat:latest
    volumes: 
         - /var/run/docker.sock:/var/run/docker.sock # Only if your script needs to interface with other docker containers
         - ./foo.sh:/etc/periodic/1min/foo.sh
```



# CI/CD
This project uses Github actions for the following:
* Mirror from [GitHub](https://github.com/11matt556/cron-socat) to [GitLab](https://gitlab.com/11matt556/cron-socat)
* Publish Github releases to [GHCR](https://github.com/11matt556/socat-cron/pkgs/container/cron-socat) and [Dockerhub](https://hub.docker.com/r/11matt556/cron-socat).

# Credits
* https://hub.docker.com/r/djpic/cron
* https://hub.docker.com/r/alpine/socat

# TODO 
* Setup Github Actions to update/notify when new alpine/socat base image is available
