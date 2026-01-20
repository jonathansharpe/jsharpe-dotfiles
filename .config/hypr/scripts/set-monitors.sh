#!/bin/sh

HOST=$(hostname)

case "$HOST" in 
	jonathan-desktop)
		hyprctl keyword monitor "HDMI-A-1, preferred, 0x0, 1.3333"
		hyprctl keyword monitor "DP-1, preferred, auto-right, 1.25"
		;;
	jonathan-thinkpad)
		hyprctl keyword monitor "eDP-1, preferred, auto, 1.25"
		;;
	*)
		echo "Unkown machine: $HOST"
		;;
esac
