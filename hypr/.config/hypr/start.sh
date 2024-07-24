#!/usr/bin/env bash

# Initializes wallpaper daemon
# swww init &

# Sets wallpaper
# swww img ~/Wallpapers/gruvbox-mountain-village.png &

# This can be installed by adding pkgs.networkmanagerapplet to your packages
# nm-applet --indicator &

# Debug: waybar --log-level debug
# waybar --config ~/.config/waybar/config.jsonc --style ~/.config/waybar/style.css &

systemctl --user start xremap &

# dunst notification manager
dunst
