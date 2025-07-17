#!/bin/bash

sketchybar --add item memory right \
	   --set memory \
	   	update_freq=2 \
		script="$PLUGIN_DIR/memory.sh" \
		icon="􀫦" \
		padding_left=2 \
		padding_right=2 \
		label.padding_right=10 \
		icon.padding_left=8 
