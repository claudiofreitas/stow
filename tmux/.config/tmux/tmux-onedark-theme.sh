#!/usr/bin/env bash
onedark_black="#181818"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

get() {
  local option=$1
  local default_value=$2
  local option_value="$(tmux show-option -gqv "$option")"

  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

set() {
  local option=$1
  local value=$2
	# -g = global
	# -q = suppresses errors about unknown or ambiguous options
  tmux set-option -gq "$option" "$value"
}

setw() {
  local option=$1
  local value=$2
  tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$onedark_white"
set "message-bg" "$onedark_black"

set "message-command-fg" "$onedark_white"
set "message-command-bg" "$onedark_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$onedark_black"
setw "window-status-bg" "$onedark_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$onedark_black"
setw "window-status-activity-fg" "$onedark_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onedark_comment_grey"
set "window-active-style" "fg=$onedark_white"

set "pane-border-fg" "$onedark_white"
set "pane-border-bg" "$onedark_black"
set "pane-active-border-fg" "$onedark_green"
set "pane-active-border-bg" "$onedark_black"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "$onedark_black"
set "status-fg" "$onedark_white"

set "@prefix_highlight_fg" "$onedark_black"
set "@prefix_highlight_bg" "$onedark_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "【"
set "@prefix_highlight_output_suffix" "】"

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

# dotfiles status
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CALENDAR_ICON=""
CLOCK_ICON="󱑏"

# https://man7.org/linux/man-pages/man1/tmux.1.html#STYLES
# https://man7.org/linux/man-pages/man1/tmux.1.html#OPTIONS
set "status-left"  "#[fg=$onedark_green,bg=$onedark_black,nobold,nounderscore,noitalics] [#S] "
set "status-right" "#{prefix_highlight}#[fg=$onedark_black,bg=$onedark_green,bold] ${CALENDAR_ICON} ${date_format}  ${CLOCK_ICON} ${time_format}  #{online_status}  #($CURRENT_DIR/dotfiles-status.sh)"

MAGNIFYING_ICON="󰍉"
WINDOW_ICON=""

# window-status-format is for all the windows, window-status-current-format is for the active one.
set "window-status-current-format" "#[fg=$onedark_black,bg=$onedark_green,nobold] #{?window_zoomed_flag,${MAGNIFYING_ICON},${WINDOW_ICON}} #I. #W "
set "window-status-format"         "#[fg=$onedark_white,bg=$onedark_black] #{?window_zoomed_flag,${WINDOW_ICON},${WINDOW_ICON}} #I. #W "

