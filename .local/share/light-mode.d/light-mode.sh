#!/bin/sh

kvantummanager --set Fluent-round && notify-send "kvantum theme changed"
plasma-apply-colorscheme Zorin16GreenLight && notify-send "plasma colors changed"
# plasma-apply-desktoptheme Itchy && notify-send "plasma theme changed"
# /usr/lib/plasma-changeicons Newaita-reborn && notify-send "icons changed"
