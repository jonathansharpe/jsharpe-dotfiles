#!/bin/sh

kvantummanager --set Catppuccin-Macchiato-Blue && notify-send "kvantum theme changed"
plasma-apply-colorscheme CatppuccinMacchiato && notify-send "plasma colors changed"
plasma-apply-desktoptheme Scratchy && notify-send "plasma theme changed"
/usr/lib/plasma-changeicons Newaita-reborn-dracula-dark && notify-send "icons changed"
