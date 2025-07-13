#!/bin/bash

# Power consumption item
sketchybar --add item power right \
           --set power update_freq=5 \
                       script="$PLUGIN_DIR/power.sh" \
                       click_script="open /System/Applications/Utilities/Activity\ Monitor.app" \
           --subscribe power system_woke

                    #    icon.font="SF Pro:Semibold:14.0" \
                    #    label.font="SF Pro:Semibold:14.0" \
                    #    click_script="open /Applications/Utility/Activity\ Monitor.app" \