# Dotfiles

Included:
- hyde
- hypr
- kitty
- nvim
- zsh/shell
- some scripts

## Highlights

### Audio I/O Switcher
I created a rofi script that allows selection of audio input and
output devices. Useful when switching between headphones and
speakers for example. I use this every day

### Updater script
I use paru for updates, and when a package fails it
will stop updating any further packages. My script will attempt to
update every package individually, so if one fails it will just move
onto the next one instead of stopping the program.

### Lock screen fixer
When I turn my monitors back on, hyprlock will often crash. This
script will detect when the monitors come back on, and run the
commands to restart hyprlock so I don't have to go into a TTY and do
it manually.

## How to install

1. Run these commands:
```
cd
git clone https://github.com/jonathansharpe/jsharpe-dotfiles/ dotfiles
cd dotfiles
```
2. I recommend `stow` for dotfiles syncing. Once it's installed with
   your systems package manager, run `stow --adopt .` and it will
   create symlinks in your `.config` folder, or wherever your configs
   are stored.
