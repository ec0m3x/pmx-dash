#!/usr/bin/env bash
# Deploy pmx-dash to PMX01
set -e
TARGET_HOST="${1:-PMX01}"
scp pmx-dash "${TARGET_HOST}:/usr/local/bin/pmx-dash"
ssh "${TARGET_HOST}" "chmod +x /usr/local/bin/pmx-dash"
echo "Deployed to ${TARGET_HOST}:/usr/local/bin/pmx-dash"
