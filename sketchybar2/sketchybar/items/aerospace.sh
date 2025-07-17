#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  if [[ -n $(aerospace list-windows --workspace $sid) ]]; then
    sketchybar --add item space.$sid left \
               --set space.$sid label="$sid" \
	                        label.color=$WHITE \
				icon.color=$WHITE \
               --subscribe aerospace_workspace_change
  else : 
  fi
done 
