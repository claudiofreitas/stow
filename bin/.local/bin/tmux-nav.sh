#!/usr/bin/env bash

if [[ -z $1 ]]; then
  session=$({ find ~ ~/repos -mindepth 1 -maxdepth 1 -type d -o -type l; echo "/tmp"; } | fzf)
else
  session=$1
fi

if [[ -z $session ]]; then
  exit 0
fi

session_name=$(basename "$session" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  # Not inside tmux && Tmux is not running
  tmux new-session -s $session_name -c $session
  exit 0
fi

if ! tmux has-session -t "$session_name" 2> /dev/null; then
  tmux new-session -s "$session_name" -c "$session" -d
fi

if [[ -z $TMUX ]]; then
  # Not inside tmux
  tmux attach-session -t "$session_name"
else
  tmux switch-client -t "$session_name"
fi
