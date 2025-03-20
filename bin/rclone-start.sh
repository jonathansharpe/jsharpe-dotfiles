#!/bin/sh
DIR="$HOME/OneDrive/"

if [ -n "$(ls -A $DIR)" ]; then
	echo "rclone already started"
else
	/usr/bin/rclone mount onedrive: $HOME/OneDrive \
		--config=$HOME/.config/rclone/rclone.conf \
		--vfs-cache-mode writes \
		--stats 2s \
		-v
	# /usr/bin/rclone mount onedrive: $HOME/OneDrive \
	# 	--config=$HOME/.config/rclone/rclone.conf
	notify-send "rclone started"
fi
