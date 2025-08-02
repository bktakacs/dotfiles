#!/usr/bin/env zsh
# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS
MAX_LENGTH=15
source "$CONFIG_DIR/colors.sh"

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))
# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"
update_track() {
    if [[ -z $SPOTIFY_JSON ]]; then
        sketchybar --set $NAME background.drawing=off label.drawing=on label=""
        return
    fi
    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
    if [ $PLAYER_STATE = "Playing" ]; then
        TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
        ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"
        
        PLAYING_ICON=""
        # Use SketchyBar's built-in scrolling with max_chars and scroll_texts
        sketchybar --set $NAME \
            label="${TRACK} $PLAYING_ICON ${ARTIST}" \
            label.drawing=on \
            label.max_chars=$MAX_LENGTH \
            scroll_texts=on \
            label.scroll_duration=200 \
            background.color=$BACKGROUND_1 \
            background.drawing=on
    elif [ $PLAYER_STATE = "Paused" ]; then
        sketchybar --set $NAME background.drawing=off label="" scroll_texts=off label.max_chars=1
    elif [ $PLAYER_STATE = "Stopped" ]; then
        sketchybar --set $NAME background.drawing=off label.drawing=off

    else
        # Handle any other state (like when Spotify is closed)
        sketchybar --set $NAME background.drawing=off label.drawing=off
    fi
}
case "$SENDER" in
"mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
*)
    update_track
    ;;
esac
