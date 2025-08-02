#!/usr/bin/env zsh
# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS
MAX_LENGTH=35
source "$CONFIG_DIR/colors.sh"

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))
# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"
update_track() {
  if [[ -z $SPOTIFY_JSON ]]; then
    sketchybar --set $NAME background.color=$TRANSPARENT background.border_color=$TRANSPARENT label.drawing=no
    return
  fi
  PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
  if [ $PLAYER_STATE = "Playing" ]; then
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

    PLAYING_ICON=""
    # Use SketchyBar's built-in scrolling with max_chars and scroll_texts
    sketchybar --set $NAME \
                  label="${TRACK} $PLAYING_ICON ${ARTIST}" \
                  label.drawing=on \
                  label.max_chars=$MAX_LENGTH \
                  scroll_texts=on \
                  label.scroll_duration=200 \
                  background.color=$BACKGROUND_1 \
                  background.border_color=$WHITE
    #
  elif [ $PLAYER_STATE = "Paused" ]; then
    sketchybar --set $NAME background.drawing=off label=""
  elif [ $PLAYER_STATE = "Stopped" ]; then
    sketchybar --set $NAME background.color=0xffeed49f label.drawing=no
  else
    sketchybar --set $NAME background.color=$BACKGROUND_1
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
