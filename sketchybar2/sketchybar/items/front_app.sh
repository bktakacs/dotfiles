#!/bin/sh

front_app=(
  icon.background.drawing=on
  script="$PLUGIN_DIR/front_app.sh"
  background.color=$BACKGROUND_1 
  background.border_color=$BACKGROUND_2
  icon.font="sketchybar-app-font:Regular:16.0"
  icon.color=$WHITE
  label.color=$WHITE
  padding_left=2
  padding_right=2
  label.padding_left=5
  label.padding_right=5
)
sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched

