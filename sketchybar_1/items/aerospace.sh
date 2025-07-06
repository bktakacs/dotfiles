#!/bin/bash


# Add the aerospace workspace change event
sketchybar --add event aerospace_workspace_change

# Create workspace items for each workspace
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
               --subscribe space.$sid aerospace_workspace_change \
               --set space.$sid \
                     background.color=0x44ffffff \
                     background.corner_radius=5 \
                     background.height=20 \
                     background.drawing=off \
                     background.border_width=1 \
                     background.border_color=0x44ffffff \
                     label="$sid" \
                     label.color=0xff9ece6a \
                     label.font="SF Pro:Semibold:14.0" \
                     label.padding_left=8 \
                     label.padding_right=8 \
                     icon.drawing=off \
                     click_script="aerospace workspace $sid" \
                     script="$PLUGIN_DIR/aerospace.sh $sid"
done

# Initial update to highlight the current workspace
sketchybar --trigger aerospace_workspace_change