#!/bin/sh
#cat ~/tmux-default-bindings.txt | sed -e 's/-r -T/  -T/g' | cut -f 4- -w  | fzf
cat ~/tmux-default-bindings.txt | fzf
