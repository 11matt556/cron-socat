FROM alpine/socat:1.7.4.4

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
