#!/bin/bash

# build phpfpm NGINX image
cd php
docker rmi djpic/apache:phpfpm
docker build --tag djpic/apache:phpfpm .
docker push djpic/apache:phpfpm
docker rmi djpic/apache:phpfpm