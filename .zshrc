# CONFIG FILES
source ~/.config/shell/aliases.zsh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
source ~/.config/shell/catppuccin_mocha-zsh-syntax-highlighting.zsh

# plugins

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit light MichaelAquilina/zsh-auto-notify

AUTO_NOTIFY_IGNORE+=("lf" "nvim" "zellij" "tmux" "bpytop")

autoload -Uz compinit && compinit
zinit cdreplay -q

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
eval "$(fzf --zsh)"

# Ensure the HISTFILE variable is set
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000
HISTUP=erase
# Set zsh history options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always --icons=always $realpath'

set -o vi
bindkey -v
# bindkey '^f' autosuggest-accept

PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
