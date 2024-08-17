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

# VARIABLES
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_ASKPASS="/bin/ksshaskpass"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export FZF_CTRL_T_COMMAND="fd -E OneDrive -E .git -H"

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
