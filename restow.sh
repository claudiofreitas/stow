#!/usr/bin/env bash

declare -a folders=(
  "alacritty"
  "bin"
  "cht"
  "git"
  "hammerspoon"
  "karabiner"
  "kitty"
  "nvim"
  "ranger"
  "skhd"
  "spacebar"
  "tmux"
  "yabai"
  "zsh"
)

for folder in "${folders[@]}"
do
  stow -R "$folder"
done
