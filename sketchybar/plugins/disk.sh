#!/bin/bash

DISKS=("/" "/Volumes/MiniExternal")
LABEL=""

for MOUNT in "${DISKS[@]}"; do
  if [ -d "$MOUNT" ]; then
    USAGE=$(df -h "$MOUNT" | awk 'NR==2 {print $5}')
    NAME=$(basename "$MOUNT")
    # For root, show "HDD" or similar
    [ "$MOUNT" = "/" ] && NAME="Int"
    [ "$MOUNT" = "/Volumes/MiniExternal" ] && NAME="Ext"
    LABEL="$LABEL$NAME:$USAGE "
  fi
done

sketchybar --set disk label="$LABEL"
