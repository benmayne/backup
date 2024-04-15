#!/usr/bin/env bash
set -euxo pipefail

# TODO flock for locking overlapping runs

echo "$(date) executing backup.sh"

rclone sync  --progress --stats-one-line-date $BKP_LOCAL_PATH $BKP_REMOTE:$BKP_REMOTE_BUCKET/$BKP_REMOTE_PATH

echo "$(date) done"
