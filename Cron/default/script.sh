#!/bin/sh
cd /home
rm -rf cron.php
echo "Running default command...." > /dev/stdout
wget http://nginx/cron.php > /dev/stdout
