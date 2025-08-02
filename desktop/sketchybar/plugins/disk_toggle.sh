#!/bin/bash

STATE="$(sketchybar --query disk | jq -r '.label.value')"

DISKS=("/" "/Volumes/MiniExternal")

LABEL=""

SUBSTRING="%"
if [[ $STATE == *"%"* ]]; then
  for MOUNT in "${DISKS[@]}"; do
    if [ -d "$MOUNT" ]; then
      USAGE=$(df -h "$MOUNT" | awk 'END{print $4}')
      NAME=$(basename "$MOUNT")
      [ "$MOUNT" = "/" ] && NAME="HDD"
      [ "$MOUNT" = "/Volumes/MiniExternal" ] && NAME="SSD"
      LABEL="$LABEL$NAME-$USAGE "
    fi
  done
else
  for MOUNT in "${DISKS[@]}"; do
    if [ -d "$MOUNT" ]; then
      USAGE=$(df "$MOUNT" | awk 'END{ printf "%.0f", 100 - ($4 / $2) * 100 }') 
      NAME=$(basename "$MOUNT")
      [ "$MOUNT" = "/" ] && NAME="HDD"
      [ "$MOUNT" = "/Volumes/MiniExternal" ] && NAME="SSD"
      LABEL="$LABEL$NAME-$USAGE% "
    fi
  done
fi

sketchybar --set disk label="$LABEL"
