killall -q dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
dunst && notify-send "dunst restarted"

picom --experimental-backends --backend glx && notify-send "picom started"

NetworkManager
xscreensaver && notify-send "xscreensaver restarted"

killall -q redshift
while pgrep -u $UID -x redshift >/dev/null; do sleep 1; done
redshift-gtk && notify-send "redshift restarted"

fehbg
wezterm start -- ~/bin/rclone-start.sh && notify-send "rclone restarted"

notify-send "Awesome has loaded!" 
