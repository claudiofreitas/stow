#!/usr/bin/env bash

selected=$(cat ~/.config/cht/my-languages ~/.config/cht/my-core-utils | fzf)
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Enter topic: " topic

if grep -qs "$selected" ~/.config/cht/my-languages; then
  topic=$(echo $topic | tr ' ' '+')
  tmux new-window bash -c "curl -s cht.sh/$selected/$topic | less"
else
  tmux new-window bash -c "curl -s cht.sh/$selected~$topic | less"
fi
