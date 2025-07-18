#!/bin/bash

DISKS=("/" "/Volumes/MiniExternal")
LABEL=""

for MOUNT in "${DISKS[@]}"; do
   if [ -d "$MOUNT" ]; then
    USAGE=$(df "$MOUNT" | awk 'END{ printf "%.0f", 100 - ($4 / $2) * 100 }') 
#    USAGE=$(df -h "$MOUNT" | awk 'NR==2 {print $5}')
    NAME=$(basename "$MOUNT")
    # For root, show "HDD" or similar
    [ "$MOUNT" = "/" ] && NAME="HDD"
    [ "$MOUNT" = "/Volumes/MiniExternal" ] && NAME="SSD"
    LABEL="$LABEL$NAME-$USAGE% "
  fi
done

sketchybar --set disk label="$LABEL"
