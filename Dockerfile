FROM debian:jessie

# Install cron
RUN apt-get update
RUN apt-get install -y cron curl

# Add crontab file in the cron directory
RUN touch /etc/cron.d/simple-cron
RUN chmod 0644 /etc/cron.d/simple-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
COPY entrypoint.sh /entrypoint.sh

ENV CRONCMD '* * * * *  root echo "$(date): executed script" >> /var/log/cron.log 2>&1'

ENTRYPOINT ["/entrypoint.sh"]
