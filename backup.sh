#!/usr/bin/env bash
set -euxo pipefail

# TODO flock for locking overlapping runs

echo "$(date) executing backup.sh"

rclone sync --log-level INFO --log-file /config/log.log --progress --fast-list --track-renames --config /config/rclone.conf $BKP_LOCAL_PATH $BKP_REMOTE_PATH

echo "$(date) done"
