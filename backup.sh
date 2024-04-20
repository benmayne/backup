#!/usr/bin/env bash
set -euxo pipefail

# TODO flock for locking overlapping runs

echo "$(date) executing backup.sh"

rclone sync --progress $BKP_LOCAL_PATH $BKP_REMOTE_PATH

echo "$(date) done"
