#!/bin/bash

# calendar=(
#   icon=􀐫
#   icon.font="SF Pro:Black:15.0"
#   icon.padding_right=0
#   label.align=right
#   padding_left=15
#   update_freq=30
#   script="$PLUGIN_DIR/calendar.sh"
#   click_script="$PLUGIN_DIR/zen.sh"
# )

# sketchybar --add item calendar right       \
#            --set calendar "${calendar[@]}" \
#            --subscribe calendar system_woke
#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀉉 \
                          update_freq=15 \
                          script="$PLUGIN_DIR/calendar.sh" \
                          background.color=$BACKGROUND_1 \
                          background.border_color=$BACKGROUND_2 \
                          label.highlight_color=$WHITE \
                          padding_left=2 \
                          padding_right=2 \
                          label.padding_right=10 \
                          icon.padding_left=8 
