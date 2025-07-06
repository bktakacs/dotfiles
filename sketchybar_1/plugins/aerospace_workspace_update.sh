#!/usr/bin/env bash

# Get all workspaces
workspaces=$(aerospace list-workspaces --all)

# Loop through each workspace and check if it has windows
for ws in $workspaces; do
  count=$(aerospace list-windows --workspace "$ws" --count)

  if [ "$count" -gt 0 ]; then
    # If the item doesn't exist, create it
    sketchybar --query space.$ws > /dev/null 2>&1
    if [ $? -ne 0 ]; then
      sketchybar --add item space.$ws left \
        --set space.$ws \
          label="$ws" \
          click_script="aerospace workspace $ws"
    fi
  else
    # If it has no windows, remove it
    sketchybar --remove space.$ws > /dev/null 2>&1
  fi
done
