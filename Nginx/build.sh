#!/bin/sh

# What base image of NGINX to use for all builds
current_nginx_version=1.20.2

# Build standard ngnix image
docker build --build-arg nginx_version=$current_nginx_version --tag djpic/nginx:$current_nginx_version-standard .

# Build phpfpm NGINX image
cd phpfpm
docker build --build-arg nginx_version=$current_nginx_version --tag djpic/nginx:$current_nginx_version-phpfpm .
docker tag djpic/nginx:$current_nginx_version-phpfpm djpic/nginx:latest

# Create Certificate
cd ../
openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout localhost.key -out localhost.crt -config openssl.conf -extensions 'v3_req'
cp localhost.key tls/localhost.key
cp localhost.crt tls/localhost.crt
mv localhost.key phpfpm/tls/localhost.key
mv localhost.crt phpfpm/tls/localhost.crt

# Build tls NGINX image
cd tls
docker build --build-arg nginx_version=$current_nginx_version --tag djpic/nginx:$current_nginx_version-tls .
rm localhost.crt localhost.key

# Build phpfpm NGINX image with tls
cd ../phpfpm/tls
docker build --build-arg nginx_version=$current_nginx_version --tag djpic/nginx:$current_nginx_version-phpfpm-tls .
rm localhost.crt localhost.key

# Push Images
docker push djpic/nginx:$current_nginx_version-standard
docker push djpic/nginx:$current_nginx_version-tls
docker push djpic/nginx:$current_nginx_version-phpfpm
docker push djpic/nginx:$current_nginx_version-latest
docker push djpic/nginx:$current_nginx_version-phpfpm-tls

# Create Down for Maintenance Image
cd ../../downformaintenance
docker build --build-arg nginx_version=$current_nginx_version --tag djpic/nginx:$current_nginx_version-dfm .
docker push djpic/nginx:$current_nginx_version-dfm
