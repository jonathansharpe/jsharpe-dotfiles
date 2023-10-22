# CONFIG FILES
source ~/.config/shell/jonathan-config

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Download Znap, if it's not there yet.
[[ -r ~/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/znap
source ~/.zsh/znap/znap.zsh  # Start Znap
zstyle ':znap:*' repos-dir ~/.zsh/
znap source marlonrichert/zsh-autocomplete
znap source zdharma-continuum/fast-syntax-highlighting
znap source romkatv/powerlevel10k
znap source MikeDacre/careful_rm
znap source urbainvaes/fzf-marks
znap source zsh-users/zsh-syntax-highlighting

znap install zsh-users/zsh-autosuggestions
# Ensure the HISTFILE variable is set
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000
# Set zsh history options
setopt appendhistory
setopt inc_append_history
setopt histfindnodups
setopt histignorealldups

set -o vi
bindkey -v

# PLUGINS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autocomplete config
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
zstyle -e ':autocomplete:list-choices:*' list-lines 'reply=($((LINES / 3)))'
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8

if [ -x "$(command -v fzf)" ]
then
	source /usr/share/fzf/key-bindings.zsh
fi
# fpath=($fpath "/home/jonathan/.zfunctions")

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
source ~/.zsh/romkatv/powerlevel10k/powerlevel10k.zsh-theme
PATH="$HOME/.local/bin:$PATH"
