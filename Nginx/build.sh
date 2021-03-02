#!/bin/bash

# build standard ngnix image
docker rmi djpic/nginx:latest
docker build --tag djpic/nginx:standard .
docker tag djpic/nginx:standard djpic/nginx:latest
docker push djpic/nginx
docker rmi djpic/nginx:latest djpic/nginx:standard

# Build tls NGINX image
cd tls
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout localhost.key -out localhost.crt -extensions san -config <(echo "[req]"; echo distinguished_name=req; echo "[san]"; echo subjectAltName=DNS:localhost) -subj /CN=localhost
docker rmi djpic/nginx:tls
docker build --tag djpic/nginx:tls .
docker push djpic/nginx:tls
docker rmi djpic/nginx:tls
rm localhost.key
rm localhost.crt


# build phpfpm NGINX image
cd ../phpfpm/
docker rmi djpic/nginx:phpfpm
docker build --tag djpic/nginx:phpfpm .
docker push djpic/nginx:phpfpm
docker rmi djpic/nginx:phpfpm

# build phpfpm NGINX image with tls
cd tls
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout localhost.key -out localhost.crt -extensions san -config <(echo "[req]"; echo distinguished_name=req; echo "[san]"; echo subjectAltName=DNS:localhost) -subj /CN=localhost
docker rmi djpic/nginx:phpfpm-tls
docker build --tag djpic/nginx:phpfpm-tls .
docker push djpic/nginx:phpfpm-tls
docker rmi djpic/nginx:phpfpm-tls
rm localhost.key
rm localhost.crt