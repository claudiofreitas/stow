#!/usr/bin/env bash
find \
  /Applications \
  /System/Library/CoreServices \
  /System/Applications \
  /System/Applications/Utilities \
  -type d -mindepth 1 -maxdepth 1 -name "*.app" \
  | fzf -d "/" --with-nth "-1" | xargs -I {} open "{}"
