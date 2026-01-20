#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '1p' | awk '{print $2}')

# Hyprland performance
if [ $HYPRGAMEMODE = 1 ]; then
	hyprctl --batch "\
		keyword general:border_size 3;\
		keyword decoration:active_opacity 1.0 override;\
		keyword decoration:inactive_opacity 1.0 override\
	exit
else
	hyprctl reload
fi
