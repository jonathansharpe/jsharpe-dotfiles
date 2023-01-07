#!/bin/sh

kvantummanager --set Fluent-roundDark && notify-send "kvantum theme changed"
plasma-apply-colorscheme Zorin16OrangeDark && notify-send "plasma colors changed"
# plasma-apply-desktoptheme Scratchy && notify-send "plasma theme changed"
# /usr/lib/plasma-changeicons Newaita-reborn-dark && notify-send "icons changed"
