
#!/bin/bash

STATE="$(sketchybar --query stats_toggle | jq -r '.icon.value')"

if [[ $STATE == "" ]]; then
  sketchybar --set cpu  \
                   updates=when_shown \
                   drawing=off
  
  sketchybar --set memory  \
                   updates=when_shown \
                   drawing=off


  sketchybar --set disk  \
                   updates=when_shown \
                   drawing=off

  sketchybar --set power  \
                   updates=when_shown \
                   drawing=off

  sketchybar --set stats_toggle icon="" \
                                icon.padding_right=0

else
  sketchybar --set cpu  \
                   drawing=on
  
  sketchybar --set memory  \
                   drawing=on


  sketchybar --set disk  \
                   drawing=on

  sketchybar --set power  \
                   updates=when_shown \
                   drawing=off

  sketchybar --set stats_toggle icon="" \
                                icon.padding_right=3
                   
fi
