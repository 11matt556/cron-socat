FROM nginx:1.20.1-alpine

COPY localhost.crt /certs/localhost.crt
COPY localhost.key /certs/localhost.key
COPY default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app/
