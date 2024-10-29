#!/usr/bin/env sh

revert() {
	xset s 0
}

trap revert HUP INT TERM
xset s 1
i3lock --color=#12131D \
	--ignore-empty-password \
	--show-failed-attempts \
	--beep \
	--image ~/Downloads/lockscreen.png
revert

