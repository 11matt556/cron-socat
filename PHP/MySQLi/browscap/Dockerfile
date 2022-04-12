ARG php_version

FROM djpic/php:${php_version}-mysqli

COPY php.ini /usr/local/etc/php/php.ini
COPY browscap.ini /usr/local/etc/php/browscap.ini

WORKDIR /app/