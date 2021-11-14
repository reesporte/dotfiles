# ------------------------------
# ZSH OPTIONS
# ------------------------------
# enable tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# enable prompt parameter expansions
setopt PROMPT_SUBST

# terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/homebrew/bin/terraform terraform

# ------------------------------
# ALIASES
# ------------------------------
# get battery life
alias b='pmset -g batt | grep % | cut -d" " -f3 | cut -f2'
# use python3.9 by default
alias py='python3.9'
alias python='python3.9'
alias python3='python3.9'
alias pip='pip3.9'
alias pip3='pip3.9'
# execute lisp 
alias elisp='sbcl --script $1'
# ls
alias la='ls -alh'
alias l='ls'
# vim 
alias v='vim'
# clear 
alias cls='clear'
# ripgrep no ignore
alias g='rg --no-ignore $1'


# secrets 
[ -f .secret_zsh_aliases ] && source .secret_zsh_aliases

# ------------------------------
# EXPORTS
# ------------------------------
# add rust and psql and homebrew and gobin to the path
export PATH=$HOME/.cargo/bin:$HOME/homebrew/opt/libpq/bin:$HOME/homebrew/bin:$HOME/go/bin:$PATH
# tell homebrew not to update itself every fucking second
export HOMEBREW_NO_AUTO_UPDATE=1
# actual prompt customization
export PROMPT='%F{35}$(b)%# %F{33}%~%f ➾ '
# enable colors
export CLICOLOR=1
# make ls look pretty
export LSCOLORS=GxFxCxDxBxegedabagaced
# set my notes directory for the notes cli
export NOTES_HOME=~/notes

