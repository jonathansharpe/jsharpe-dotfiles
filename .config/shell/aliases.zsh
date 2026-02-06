# LAUNCH COMMAND
launch() {
	if [ -z "$1" ]; then
		echo "Usage: lu <command> [<args>]"
		return 1
	fi

	"$@" >/dev/null 2>&1 &
	disown
}
acp() {
	git add .
	git commit -m "$1"
	git push
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

if [[ -f ~/.config/secrets/api.env ]]; then
	source ~/.config/secrets/api.env
fi

# VARIABLES
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_ASKPASS="/bin/ksshaskpass"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export FZF_CTRL_T_COMMAND="fd -E OneDrive -E .git -H"
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export FZF_COMPLETION_OPTS="--multi"
export FZF_DEFAULT_OPTS="--bind 'tab:toggle+down,shift-tab:toggle+up'"

# ALIASES
alias lu='launch'
alias lux='launch xdg-open'
alias paru='paru --color=auto --sudoloop --newsonupgrade --pgpfetch --upgrademenu --bottomup --skipreview --nodevel'
alias nvimconf='cd ~/.config/nvim && nvim ./init.lua'
alias shellconf='nvim $HOME/.zshrc $HOME/.config/shell/'
alias cpwd='pwd | xclip -selection clipboard'
alias frf='sudo fc-cache -rv'
alias sfu='$HOME/bin/update-aur.sh'
alias gc='git clone'
alias ls='eza --icons=always'
alias rm='rmtrash'
# alias cd='z'
alias zls='zellij list sessions'
