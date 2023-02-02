#!/bin/sh

kvantummanager --set Relax-Kvantum && notify-send "kvantum theme changed"
plasma-apply-colorscheme AritimDark && notify-send "plasma colors changed"
plasma-apply-desktoptheme Aritim-Dark-Rounded-Blur && notify-send "plasma theme changed"
/usr/lib/plasma-changeicons Newaita-reborn-dark && notify-send "icons changed"
