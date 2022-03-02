export LANG=en_US.UTF-8

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
export STARSHIP_CONFIG=~/.starship/config.toml
export STARSHIP_CACHE=~/.starship/cache

# history size
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
setopt hist_ignore_all_dups

# auto suggestion
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# highlight
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# auto completion
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
COMPLETION_WAITING_DOTS="true"
# colorize
## colorize settings
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_CHROMA_FORMATTER=terminal16m
source ~/.zsh/plugins/colorize.plugin.zsh

# kctl shitz
autoload -Uz compinit && compinit
source <(kubectl completion zsh)
compdef __start_kubectl k
source ~/.zsh/multi-kube.sh

# Dir colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EXA_COLORS="hs_err_pid*=37;41;1"
alias ll="exa -a --long"

# autocomplete tab arrow navigation
zstyle ':completion:*' menu select
# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# alias
alias k='kubectl'
alias cat='ccat'
alias history='history -E 1'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# tfenv set to arm
export TFENV_ARCH=arm64

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# ruby
eval "$(rbenv init - zsh)"
# starship
eval "$(starship init zsh)"
# pyenv
eval "$(pyenv init -)"
