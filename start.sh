#!/usr/bin/env bash
set -euxo pipefail
echo "executing start.sh"

echo "$BACKUP_CRON_SCHEDULE /scripts/backup.sh >> /var/log/cron.log 2>&1" >> /etc/cron.d/backup-cron
crontab /etc/cron.d/backup-cron
touch /var/log/cron.log

cron && tail -f /var/log/cron.log
