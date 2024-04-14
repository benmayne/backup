#!/usr/bin/env bash
set -euxo pipefail

echo '* * * * * /scripts/backup.sh >> /var/log/cron.log 2>&1' >> /etc/cron.d/backup-cron
crontab /etc/cron.d/backup-cron
touch /var/log/cron.log

echo "executing setup.sh"