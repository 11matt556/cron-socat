ARG alpine_socat_version

FROM docker.io/alpine/socat:${alpine_socat_version}

# Installs fastcgi to execute PHP scripts in PHP-FPM container
#RUN apk update \
#    && apk add fastcgi

# Create Crontab directories
RUN mkdir /etc/periodic/1min \
    && mkdir /etc/periodic/30min \
    && mkdir /etc/periodic/12hour

# Copy in customized crontab file
COPY crontab /etc/crontabs/root

# Copy in entrypoint.sh script; this allows cron to run as daemon
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT /entrypoint.sh
