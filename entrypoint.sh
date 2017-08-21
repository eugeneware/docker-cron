#!/usr/bin/env bash
printf "${CRONCMD}\n" > /etc/cron.d/simple-cron
echo "Running crontab:"
cat /etc/cron.d/simple-cron
echo
cron && tail -f /var/log/cron.log
