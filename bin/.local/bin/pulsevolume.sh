#!/usr/bin/env bash

DELTA=$1

pactl set-sink-volume @DEFAULT_SINK@ $DELTA

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume: front-left:/ {print substr($5, 1, index($5, "%") - 1)}')

# https://wiki.archlinux.org/title/Dunst#Actions
AAA=$(dunstify \
	--hints string:x-dunst-stack-tag:volume "Volume" "$VOLUME" \
	--hints int:value:$VOLUME )

	# --action="default,Reply" --action="abla,Bleu" \

# dunstify "AAA = " "$AAA"

# notify-send \
# 	--hints string:x-dunst-stack-tag:volume "Volume" "$VOLUME"


