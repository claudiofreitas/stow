#!/usr/bin/env bash

# 200~300 seems to be a good delay
gsettings set org.gnome.desktop.peripherals.keyboard delay 250

# 25~50 seems to be a good repeat-interval
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30

gsettings set org.gnome.desktop.interface cursor-theme 'WhiteSur-cursors'

gsettings set org.gnome.desktop.background picture-uri ""
gsettings set org.gnome.desktop.background picture-uri-dark ""
gsettings set org.gnome.desktop.background primary-color "#000000"

gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
gsettings set org.gnome.desktop.session idle-delay 0
