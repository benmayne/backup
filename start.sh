#!/usr/bin/env bash
set -euxo pipefail
echo "executing start.sh"

# cron doesn't read normal env variables 
# https://stackoverflow.com/questions/27771781/how-can-i-access-docker-set-environment-variables-from-a-cron-job
printenv | grep "BKP_" >> /etc/environment

# Set up rclone config
# usually in /root/.config/rclone/
echo $(cat $(rclone config file | tail -n 1))

echo 'running backup once'
/scripts/backup.sh

# set up cron schedule
echo "$BKP_CRON_SCHEDULE /bin/bash /scripts/backup.sh >> /var/log/cron.log 2>&1" >> /etc/cron.d/backup-cron
crontab /etc/cron.d/backup-cron
touch /var/log/cron.log

cron && tail -f /var/log/cron.log
