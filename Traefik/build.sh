#!/bin/sh


# Build Traefik with default dynamic configuration
cd tls
docker build --tag djpic/traefik:tls .
docker tag djpic/traefik:tls djpic/traefik:latest

# Push to Repos
docker push djpic/traefik:latest
docker push djpic/traefik:tls
