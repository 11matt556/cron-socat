#!/bin/sh

# Build standard ngnix image
docker build --tag djpic/nginx:standard .

# Build phpfpm NGINX image
cd phpfpm
docker build --tag djpic/nginx:phpfpm .
docker tag djpic/nginx:phpfpm djpic/nginx:latest

# Create Certificate
cd ../
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout localhost.key -out localhost.crt -extensions san -config <(echo "[req]"; echo distinguished_name=req; echo "[san]"; echo subjectAltName=DNS:localhost) -subj /CN=localhost
cp localhost.key tls/localhost.key
cp localhost.crt tls/localhost.crt
mv localhost.key phpfpm/tls/localhost.key
mv localhost.crt phpfpm/tls/localhost.crt

# Build tls NGINX image
cd tls
docker build --tag djpic/nginx:tls .
rm localhost.crt localhost.key

# Build phpfpm NGINX image with tls
cd ../phpfpm/tls
docker build --tag djpic/nginx:phpfpm-tls .
rm localhost.crt localhost.key

# Push Images
docker push djpic/nginx:standard
docker push djpic/nginx:tls
docker push djpic/nginx:phpfpm
docker push djpic/nginx:latest
docker push djpic/nginx:phpfpm-tls

# Create Down for Maintenance Image
cd ../../downformaintenance
docker build --tag djpic/nginx:dfm .
docker push djpic/nginx:dfm
