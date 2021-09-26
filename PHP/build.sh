#!/bin/bash

# Pre Clean
docker rmi djpic/php:mysqli
docker rmi djpic/php:mysqli-browscap
docker rmi djpic/php:mysqli-full_php_browscap
docker rmi djpic/php:mysqli-lite_php_browscap

# Build apache image with mysqli and memcached extension
cd MySQLi
docker build --tag djpic/php:mysqli .

# Build image with browscap file
cd browscap
wget -O browscap.ini https://browscap.org/stream?q=PHP_BrowsCapINI
docker build --tag djpic/php:mysqli-browscap .
rm browscap.ini
wget -O browscap.ini https://browscap.org/stream?q=Full_PHP_BrowsCapINI
docker build --tag djpic/php:mysqli-full_php_browscap .
rm browscap.ini
wget -O browscap.ini https://browscap.org/stream?q=Lite_PHP_BrowsCapINI
docker build --tag djpic/php:mysqli-lite_php_browscap .
rm browscap.ini

# Docker Push Image
docker push djpic/php:mysqli
docker push djpic/php:mysqli-browscap
docker push djpic/php:mysqli-full_php_browscap
docker push djpic/php:mysqli-lite_php_browscap

# Docker Clean Up
docker rmi djpic/php:mysqli
docker rmi djpic/php:mysqli-browscap
docker rmi djpic/php:mysqli-full_php_browscap
docker rmi djpic/php:mysqli-lite_php_browscap