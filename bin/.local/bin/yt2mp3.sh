#!/usr/bin/env bash

ARGS="$@"

yt-dlp -x --audio-format mp3 "$ARGS"
