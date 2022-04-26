#!/bin/sh

/usr/bin/rclone mount onedrive: /home/jonathansharpe/OneDrive \
    --config=/home/jonathansharpe/.config/rclone/rclone.conf \
    --vfs-cache-mode writes
