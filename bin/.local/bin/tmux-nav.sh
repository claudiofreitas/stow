#!/usr/bin/env bash

function sourceIfExists {
	local debugNotFound=0
  if [[ -s $1 ]]; then
		source "$1"
	else
		if [[ $debugNotFound = 1 ]]; then
			echo "$1 not found"
		fi
	fi
}

sourceIfExists "$HOME"/.local/bin/tmux-nav/load-work-sessions.sh

if [[ -z $1 ]]; then
  session=$({ 
		find ~ -mindepth 1 -maxdepth 1 -type d -o -type l;
		find ~/repos -mindepth 1 -maxdepth 1 -type d -o -type l;
		(load_tmux_nav_work_sessions 2> /dev/null;);
		echo "/tmp";
	} | fzf)
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
  tmux new-session -s "$session_name" -c "$session"
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
