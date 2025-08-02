#!/bin/bash

sketchybar --add item calendar right \
  --set calendar icon=􀉉 \
  update_freq=15 \
  script="$PLUGIN_DIR/calendar.sh" \
  padding_left=2 \
  padding_right=2 \
  icon.padding_left=8
