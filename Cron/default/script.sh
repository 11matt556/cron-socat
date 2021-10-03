#!/bin/sh
echo "Running default command...." > /dev/stdout
SCRIPT_NAME=/app/private/cron.php \
SCRIPT_FILENAME=/app/private/cron.php \
REQUEST_METHOD=GET \
cgi-fcgi -bind -connect php:9000