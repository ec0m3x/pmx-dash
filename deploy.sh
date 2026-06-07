#!/usr/bin/env bash
# Deploy pmx-dash to a Proxmox host
set -e

if [ -n "$1" ]; then
    TARGET="$1"
else
    read -rp "Target host (SSH alias or IP): " TARGET
    [ -z "$TARGET" ] && { echo "No host given, aborting."; exit 1; }
fi

scp pmx-dash "${TARGET}:/usr/local/bin/pmx-dash"
ssh "${TARGET}" "chmod +x /usr/local/bin/pmx-dash"
echo "Deployed to ${TARGET}:/usr/local/bin/pmx-dash"
echo "Run with: pmx-dash [--iface IFACE]"
