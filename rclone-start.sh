#!/bin/sh
DIR="$HOME/OneDrive/"

if [ -n "$(ls -A $DIR)" ]; then
	echo "$DIR already populated"
else
	/usr/bin/rclone mount onedrive: $HOME/OneDrive \
		--config=$HOME/.config/rclone/rclone.conf \
		--vfs-cache-mode writes
fi
