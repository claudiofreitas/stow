#!/usr/bin/env bash

#SCREEN_WIDTH=$(yabai -m query --displays --display | jq .frame.w*2)
#SCREEN_HEIGHT=$(yabai -m query --displays --display | jq .frame.h*2)

#TERM_WIDTH=1280
#TERM_HEIGHT=1260

#let "X=SCREEN_WIDTH/2-TERM_WIDTH/2"
#let "Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"

#echo $X
#echo $Y

#alacritty \
#  --title "MyLauncher" \
#  -o window.position.x="${X}" \
#  -o window.position.y="${Y}" \
#  -o window.dimensions.lines=10 \
#  -o window.dimensions.columns=10 \
#  -o window.decorations=none \
#  --working-directory "$(pwd)" \
#  -e "$1"

kitty \
  --title "kittylauncher" \
  sh -c "$1"
