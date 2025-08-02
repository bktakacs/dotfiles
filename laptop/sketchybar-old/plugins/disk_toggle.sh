#!/bin/bash

STATE="$(sketchybar --query disk | jq -r '.label.value')"

LABEL="HDD-"


SUBSTRING="%"
if [[ $STATE == *"%"* ]]; then
	sketchybar --set "$NAME" label="$LABEL$(df -h | awk '$9=="/" {print $4}')"
else
	sketchybar --set "$NAME" label="$LABEL$(df "/" | awk 'END{ printf "%.0f", 100 - ($4 / $2) * 100 }')%"
fi  
