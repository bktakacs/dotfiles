#!/usr/bin/env bash

# ~/.config/sketchybar/plugins/aerospace_workspace_change.sh
# This script handles workspace changes and updates all workspace items

# Get the currently focused workspace
# FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

# # Update all workspace items
# for sid in $(aerospace list-workspaces --all); do
#     if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
#         # This is the focused workspace - highlight it
#         sketchybar --set space.$sid \
#             background.drawing=on \
#             background.color=0xff7aa2f7 \
#             label.color=0xff000000
#     else
#         # This is not the focused workspace - dim it
#         sketchybar --set space.$sid \
#             background.drawing=off \
#             label.color=0xff9ece6a
#     fi
# done


# sid="$1"

# # Count windows in the workspace
# cnt=$(aerospace list-windows --workspace "$sid" --count)

# if [ "$cnt" -gt 0 ]; then
#   sketchybar --set space.$sid background.drawing=on
# else
#   sketchybar --set space.$sid background.drawing=off
# fi


# Only add this once!
sketchybar --add event aerospace_workspace_change

if ! sketchybar --query workspace_updater &>/dev/null; then
  sketchybar --add item workspace_updater center
fi

sketchybar --subscribe workspace_updater aerospace_workspace_change
sketchybar --set workspace_updater \
  script="$CONFIG_DIR/plugins/aerospace_workspace_update.sh" \
  drawing=off