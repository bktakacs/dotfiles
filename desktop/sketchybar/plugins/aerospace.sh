#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=$CLOUDPINK label.color=0xff000000 icon.color=0xff000000 background.border_color=$WHITE background.border_width=2
else
  sketchybar --set $NAME background.color=$BLACK label.color=$WHITE icon.color=$WHITE background.border_color=$BACKGROUND_2 label.shadow.drawing=off icon.shadow.drawing=off background.border_width=2
fi
