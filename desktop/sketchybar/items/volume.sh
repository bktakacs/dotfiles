#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                padding_left=2 \
                padding_right=2 \
                label.padding_right=10 \
                icon.padding_left=8 \
           --subscribe volume volume_change \
