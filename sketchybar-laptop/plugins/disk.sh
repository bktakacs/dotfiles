#!/bin/bash

DISKS=("/")
LABEL=""

for MOUNT in "${DISKS[@]}"; do
   if [ -d "$MOUNT" ]; then
    USAGE=$(df "$MOUNT" | awk 'END{ printf "%.0f", 100 - ($4 / $2) * 100 }') 
    NAME=$(basename "$MOUNT")
    # For root, show "HDD" or similar
    [ "$MOUNT" = "/" ] && NAME="HDD"
    LABEL="$LABEL$NAME-$USAGE%"
  fi
done

sketchybar --set disk label="$LABEL"
