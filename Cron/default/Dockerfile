FROM djpic/cron:standard

# Copy FastCGI script to run every minute
COPY script.sh /etc/periodic/1min/default

# Update permissions on FastCGI script
RUN chmod 755 /etc/periodic/1min/default
