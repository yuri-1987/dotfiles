export LANG=en_US.UTF-8

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship
export STARSHIP_CONFIG=~/.starship/config.toml
export STARSHIP_CACHE=~/.starship/cache

# history size
export HISTSIZE=2000

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

# autocomplete tab arrow navigation
zstyle ':completion:*' menu select
# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# alias
alias ll='ls -lah'
alias k='kubectl'
alias cat='ccat'
alias history='history -E 1'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

eval "$(starship init zsh)" 