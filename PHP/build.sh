#!/bin/bash

# Declare array to define the two different versions that will be used
# First one is the current stable version; the first is the newer supported version
php_versions=(8.0.27 8.1.15)

for php_version in "${php_versions[@]}"
do
  # Build apache image with mysqli and memcached extension
  cd MySQLi
  docker build --build-arg php_version=$php_version --tag djpic/php:$php_version-mysqli .

  # Build image with browscap file
  cd browscap
  wget -O browscap.ini https://browscap.org/stream?q=PHP_BrowsCapINI
  docker build --build-arg php_version=$php_version --tag djpic/php:$php_version-mysqli-browscap .
  rm browscap.ini
  wget -O browscap.ini https://browscap.org/stream?q=Full_PHP_BrowsCapINI
  docker build --build-arg php_version=$php_version --tag djpic/php:$php_version-mysqli-full_php_browscap .
  rm browscap.ini
  wget -O browscap.ini https://browscap.org/stream?q=Lite_PHP_BrowsCapINI
  docker build --build-arg php_version=$php_version --tag djpic/php:$php_version-mysqli-lite_php_browscap .
  rm browscap.ini

  # Docker Push Image
  docker push djpic/php:$php_version-mysqli
  docker push djpic/php:$php_version-mysqli-browscap
  docker push djpic/php:$php_version-mysqli-full_php_browscap
  docker push djpic/php:$php_version-mysqli-lite_php_browscap

  cd ../../
done