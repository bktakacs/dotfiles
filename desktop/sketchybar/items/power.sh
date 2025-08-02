#!/bin/bash

# Power consumption item
sketchybar --add item power right \
  --set power update_freq=5 \
  script="$PLUGIN_DIR/power.sh" \
  click_script="open /System/Applications/Utilities/Activity\ Monitor.app" \
  padding_left=2 \
  padding_right=2 \
  label.padding_right=10 \
  icon.padding_left=8 \
  --subscribe power system_woke
