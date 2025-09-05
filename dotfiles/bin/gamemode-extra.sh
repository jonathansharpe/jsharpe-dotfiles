#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '1p' | awk '{print $2}')

# Hyprland performance
if [ $HYPRGAMEMODE = 1 ]; then
	hyprctl --batch "\
		keyword general:border_size 3;\
		keyword windowrulev2 opacity 1.0 1.0,class:^(.*)$"
	exit
else
	hyprctl reload
fi
