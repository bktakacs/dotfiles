#!/bin/bash

sketchybar --add event spotify_change $SPOTIFY_EVENT \
	   --add item spotify q \
	   --set spotify \
		background.color=$BACKGROUND_1 \
		background.border_color=$BACKGROUND_2 \
		label.highlight_color=$WHITE \
		padding_left=2 \
		padding_right=2 \
		label.padding_right=10 \
		script="$PLUGIN_DIR/spotify.sh" \
	   --subscribe spotify spotify_change mouse.clicked
