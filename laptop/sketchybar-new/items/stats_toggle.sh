#!/bin/bash

sketchybar --add item stats_toggle right \
           --set stats_toggle \
                 icon="" \
                 click_script="$PLUGIN_DIR/stats_toggle.sh" \
                 icon.padding_right=3 \
                 padding_right=0

