#!/bin/sh
echo "Running default command...." > /dev/stdout
SCRIPT_NAME=/app/private/scheduled_jobs/1min.php \
SCRIPT_FILENAME=/app/private/scheduled_jobs/1min.php \
REQUEST_METHOD=GET \
cgi-fcgi -bind -connect php:9000