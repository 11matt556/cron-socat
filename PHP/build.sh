#!/bin/sh

current_php_version=8.0.19

# Build apache image with mysqli and memcached extension
cd MySQLi
docker build --build-arg php_version=$current_php_version --tag djpic/php:$current_php_version-mysqli .

# Build image with browscap file
cd browscap
wget -O browscap.ini https://browscap.org/stream?q=PHP_BrowsCapINI
docker build --build-arg php_version=$current_php_version --tag djpic/php:$current_php_version-mysqli-browscap .
rm browscap.ini
wget -O browscap.ini https://browscap.org/stream?q=Full_PHP_BrowsCapINI
docker build --build-arg php_version=$current_php_version --tag djpic/php:$current_php_version-mysqli-full_php_browscap .
rm browscap.ini
wget -O browscap.ini https://browscap.org/stream?q=Lite_PHP_BrowsCapINI
docker build --build-arg php_version=$current_php_version --tag djpic/php:$current_php_version-mysqli-lite_php_browscap .
rm browscap.ini

# Docker Push Image
docker push djpic/php:$current_php_version-mysqli
docker push djpic/php:$current_php_version-mysqli-browscap
docker push djpic/php:$current_php_version-mysqli-full_php_browscap
docker push djpic/php:$current_php_version-mysqli-lite_php_browscap
