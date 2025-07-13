#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                background.color=$BACKGROUND_1 \
                background.border_color=$BACKGROUND_2 \
                label.highlight_color=$WHITE \
                padding_left=20 \
                padding_right=20 \
                label.padding_right=10 \
                icon.padding_left=8 \
           --subscribe volume volume_change \