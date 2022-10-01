#! /bin/bash
if [ -z "$(pidof dunst)" ]; then
	dunst & 
	notify-send "dunst started"
fi

if [ -z "$(pidof picom)" ]; then
	picom --experimental-backends -b && notify-send "picom started"
fi

NetworkManager
if [ -z "$(pidof xscreensaver)" ]; then
	xscreensaver &
fi

if [ -z "$(pidof redshift)" ]; then
	redshift-gtk & 
	notify-send "redshift started"
fi

wezterm start -- ~/bin/rclone-start.sh

notify-send "Awesome has loaded!" 
