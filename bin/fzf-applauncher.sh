#!/usr/bin/env bash
# https://gitlab.com/wef/dotfiles/-/blob/master/bin/fzf-launcher
export TIME_STAMP="20240113.184222"
# shellcheck disable=SC2034

# Copyright (C) 2020-2023 Bob Hepple <bob dot hepple at gmail dot com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

PROG=$( basename "$0" )
TEMP=$( getopt --options hvn: --longoptions verbose,help,nlines: -- "$@" ) || exit 1
eval set -- "$TEMP"
columns=$( tput cols )
nlines=10

while [[ "$1" ]]; do
    case "$1" in
        -h|--help)
            echo "Usage: $PROG OPTIONS"
            echo
            {
                echo "TUI program launcher using fzf. It presents Categories as well as the Names"
                echo "of the apps and searches on both. Ctrl-v will view the .desktop file."
                echo
                echo "It can be useful to bind this as your launcher eg in sway or i3wm:"
                echo
                echo "bindsym \$mod+d exec foot -e fzf-launcher"
                echo
                echo "(You can use almost any terminal emulator instead of foot.)"
                echo
                echo "If you have a huge number of categories, you might need a larger terminal, a smaller font or to reduce nlines."
            } | fmt -w "$columns"
            echo
            echo "OPTIONS"
            echo "-n|--nlines <n>           number of lines to display ($nlines)"
            echo "-h|--help                 this help"
            echo "-v|--verbose              be verbose"
            exit 0
            ;;
        -v|--verbose)
            verbose="set"
            shift
            ;;
        -n|--nlines)
            shift
            nlines=$1
            shift
            ;;
        --)
            shift
            ;;
    esac
done

if [[ "$verbose" ]]; then
    set -x
fi

locations=( "$HOME/.local/share/applications" "/usr/share/applications" )

#print out the available categories:
grep -r '^Categories' "${locations[@]}" |
cut -d= -f2- |
tr ';' '\n' |
sed -r "s/X-GNOME-|X-LXDE-|X-XFCE-|X-//I" |
sort -u|
column

# shellcheck disable=SC2016
selected_app=$(
    find "${locations[@]}" -name '*.desktop' |
    while read -r desktop; do
        cat=$( awk -F= '/Categories/ {print $2}' "$desktop" )
        name=${desktop##*/} # remove directory
        name=${name%.*}     # remove . suffix
        name=${name##*.}    # remove . prefixes
        echo "$name '$cat' $desktop"
    done |
    column -t |
    fzf -i --exact --reverse --height "$nlines" --ansi \
        --bind "home:first" --bind "end:last" \
        --bind 'ctrl-z:change-preview-window(hidden|)' \
        --bind 'ctrl-v:execute(less {3} >/dev/tty)' \
        --preview-label 'Ctrl-z: toggle details' \
        --preview 'grep -iE "^(name=|exec=|categories=)" {3}; echo -e "\nCtrl-v to view full .desktop file"' | 
    awk '{print $3}'
            )

echo "$PROG: $(date): selected app='$selected_app'" >> ~/.cache/fzf-launcher.log
if [[ "$selected_app" ]]; then
    # $selected_app is a fully qualified filename of a .desktop file
    app="${selected_app##*/}" # basename

    # daemonize properly is the right way to do this:
    # https://www.reddit.com/r/bash/comments/18c26qs/nohup_not_working/
    cd /
    #eval exec {0..255}\>\&- # NO! losses connection to X11/Wayland session?
    setsid /usr/bin/gtk-launch "$app" </dev/null &>/dev/null
fi


# Local Variables:
# mode: shell-script
# time-stamp-pattern: "4/TIME_STAMP=\"%:y%02m%02d.%02H%02M%02S\""
# eval: (add-hook 'before-save-hook 'time-stamp)
# End:

