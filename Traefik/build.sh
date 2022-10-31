#!/bin/sh

# What base image of Traefik to use for all builds
current_traefik_version=2.9.4

# Build Traefik with default dynamic configuration
cd tls
docker build --build-arg traefik_version=$current_traefik_version --tag djpic/traefik:$current_traefik_version-tls .
docker tag djpic/traefik:$current_traefik_version-tls djpic/traefik:latest

# Push to Repos
docker push djpic/traefik:latest
docker push djpic/traefik:$current_traefik_version-tls
