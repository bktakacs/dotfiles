#!/bin/bash

sketchybar --add item calendar right \
  --set calendar icon=􀉉 \
  update_freq=15 \
  script="$PLUGIN_DIR/calendar.sh" \
  padding_left=2 \
  padding_right=2 \
  label.padding_right=10 \
  icon.padding_left=8 \
  
# background.color=$BACKGROUND_1 #click_script="$PLUGIN_DIR/togglebar.sh" # background.border_color=$BACKGROUND_2 \
