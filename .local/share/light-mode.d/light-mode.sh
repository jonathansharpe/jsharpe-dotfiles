#!/bin/sh

kvantummanager --set Catppuccin-Latte-Blue && notify-send "kvantum theme changed"
plasma-apply-colorscheme CatppuccinLatte && notify-send "plasma colors changed"
plasma-apply-desktoptheme Itchy && notify-send "plasma theme changed"
/usr/lib/plasma-changeicons Newaita-reborn-dracula && notify-send "icons changed"
