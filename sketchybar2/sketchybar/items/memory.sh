#!/bin/bash

sketchybar --add item memory right \
	   --set memory \
	   	update_freq=2 \
		script="$PLUGIN_DIR/memory.sh" \
		icon="􀫦" \
		background.color=$BACKGROUND_1 \
		background.border_color=$BACKGROUND_2 \
		label.highlight_color=$WHITE \
		padding_left=2 \
		padding_right=2 \
		label.padding_right=10 \
		icon.padding_left=8 \
