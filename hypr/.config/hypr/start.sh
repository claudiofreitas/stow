#!/usr/bin/env bash

# Initializes wallpaper daemon
swww init &

# Sets wallpaper
# swww img ~/Wallpapers/gruvbox-mountain-village.png &

# This can be installed by adding pkgs.networkmanagerapplet to your packages
nm-applet --indicator &

# The bar
waybar &

# dunst notification manager
dunst
