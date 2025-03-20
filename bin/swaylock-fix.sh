#!/usr/bin/env bash

MONITOR1="HDMI-A-1"
MONITOR2="DP-1"
PREVIOUS_STATE="off"

while true; do
	if pgrep -x "swaylock" > /dev/null; then
		while true; do
			ACTIVE_MONITORS=$(hyprctl monitors | awk '/^Monitor / {print $2}')
			# notify-send "Checking monitor status"
			if echo "$ACTIVE_MONITORS" | grep "$MONITOR1" && echo "$ACTIVE_MONITORS" | grep "$MONITOR2"; then
				if [ "$PREVIOUS_STATE" = "off" ]; then
					echo "Monitors turned on, restarting swaylock"
					pkill swaylock
					hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1' && hyprctl --instance 0 'dispatch exec swaylock'
					PREVIOUS_STATE="on"
				fi
			else
				PREVIOUS_STATE="off"
			fi
			sleep 2
		done
	else
		sleep 2
	fi
done
