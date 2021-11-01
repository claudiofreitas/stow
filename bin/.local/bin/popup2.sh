#!/usr/bin/env bash

TITLE=mylauncher

SCREEN_WIDTH=$(yabai -m query --displays --display | jq .frame.w*2)
SCREEN_HEIGHT=$(yabai -m query --displays --display | jq .frame.h*2)

echo $SCREEN_WIDTH
echo $SCREEN_HEIGHT

TERM_WIDTH=1280
TERM_HEIGHT=1260
#TERM_WIDTH=800
#TERM_HEIGHT=400

let "X=SCREEN_WIDTH/2-TERM_WIDTH/2"
let "Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"

echo $X
echo $Y

alacritty \
  --title "${TITLE}" \
  -o window.position.x="1280" \
  -o window.position.y="850" \
  -o window.dimensions.lines=35 \
  -o window.dimensions.columns=80 \
  -o window.decorations=none \
  --working-directory "$(pwd)" \
  -e bash -c "echo X=${X} Y=${Y} W=${SCREEN_WIDTH} H=${SCREEN_HEIGHT}; read;"
  #-e "$1"

