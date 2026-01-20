#!/usr/bin/env bash
# what do we want to do: open a given directory in the active zellij session in the active kitty window
# if no existing zellij session exists, create one
# if no existing kitty instance exists, create one
# 
# final result should be a zsh prompt
# how do we do that?
# `exec $SHELL`
#
# what are we passing into said prompt? the directory
# `exec $SHELL -is "cd '$DIR'"`
#
# where are we running this shell command? in zellij
# `zellij r --close-on-exit -- $SHELL -is "cd '$DIR'"`
#
# where are we running this zellij command? in an existing kitty window
# `kitty -e zellij r --close-on-exit -- $SHELL -is "cd '$DIR'"`

DIR="$1"
SESSION="main"

if zellij list-sessions | grep "$SESSION"; then
	zellij run --close-on-exit -session "$SESSION" -- $SHELL -is "cd '$DIR'"
else
	zellij -s "$SESSION" && zellij run -session "$SESSION" -- $SHELL -is "cd '$DIR'"
fi
