#!/bin/sh

kvantummanager --set Relax-Light-Kvantum && notify-send "kvantum theme changed"
plasma-apply-colorscheme AritimLight && notify-send "plasma colors changed"
plasma-apply-desktoptheme Aritim-Light-Rounded-Blur && notify-send "plasma theme changed"
/usr/lib/plasma-changeicons Newaita-reborn && notify-send "icons changed"
