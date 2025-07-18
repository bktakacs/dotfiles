#!/bin/bash

if [[ $(sketchybar --query bar | jq '.drawing' | awk -F"\"" ' {print $2} ') = "on" ]]; then
  for sid in $(aerospace list-workspaces --all); do
    sketchybar --set space.$sid drawing=off
  done

  sketchybar --set rightside drawing=off
  sketchybar --set power cpu memory disk drawing=off
else
  for sid in $(aerospace list-workspaces --all); do
    sketchybar --set space.$sid drawing=on
  done

  sketchybar --set rightside power cpu memory disk drawing=on

fi
