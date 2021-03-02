#!/bin/bash

# Pre Clean Up
docker rmi djpic/traefik:latest
docker rmi djpic/traefik:tls

# Build Traefik with default dynamic configuration
cd tls
docker build --tag djpic/traefik:tls .
docker tag djpic/traefik:tls djpic/traefik:latest

# Push to Repos
docker push djpic/traefik:latest
docker push djpic/traefik:tls

# Post Clean Up
docker rmi djpic/traefik:latest
docker rmi djpic/traefik:tls


#Build Traefik with static configuration
cd static
docker build --tag djpic/custom-traefik:latest .

#Push to Repo
docker push djpic/custom-traefik:latest

#Post Clean Up
docker rmi djpic/custom-traefik:latest