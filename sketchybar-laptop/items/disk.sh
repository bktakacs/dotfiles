#!/bin/bash
# filepath: /Volumes/MiniExternal/Users/bencetakacs/.config/sketchybar/items/disk.sh

sketchybar --add item disk right \
           --set disk update_freq=1800 \
                      script="$PLUGIN_DIR/disk.sh" \
                      icon="􀥾" \
                      padding_left=2 \
                      padding_right=2 \
                      label.padding_right=10 \
                      icon.padding_left=8
