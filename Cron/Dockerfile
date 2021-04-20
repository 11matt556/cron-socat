FROM alpine:3.13.5

RUN mkdir /etc/periodic/1min
RUN mkdir /etc/periodic/30min
RUN mkdir /etc/periodic/12hour

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
COPY crontab /etc/crontabs/root

ENTRYPOINT /entrypoint.sh