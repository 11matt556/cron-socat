FROM nginx:1.19.8-alpine

COPY localhost.crt /certs/localhost.crt
COPY localhost.key /certs/localhost.key
COPY default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app/
