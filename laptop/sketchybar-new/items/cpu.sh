#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=3 \
                      icon=􀫥 \
                      script="$PLUGIN_DIR/cpu.sh" \
                      padding_left=2 \
                      padding_right=2 \
                      label.padding_right=4 \
                      icon.padding_left=4 
