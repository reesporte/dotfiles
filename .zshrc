# ------------------------------
# ZSH OPTIONS
# ------------------------------
# enable fuzzy tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# enable prompt parameter expansions
setopt PROMPT_SUBST

# ------------------------------
# ALIASES
# ------------------------------
# get battery life
alias b='pmset -g batt | grep % | cut -d" " -f3 | cut -f2'
# use python3.9 by default
alias python='python3.9'
alias python3='python3.9'
alias pip='pip3.9'
alias pip3='pip3.9'

# secrets 
[ -f .secret_zsh_aliases ] && source .secret_zsh_aliases

# ------------------------------
# EXPORTS
# ------------------------------
# add homebrew and gobin to the path
export PATH=$PATH:~/homebrew/bin:~/go/bin
# tell homebrew not to update itself every fucking second
export HOMEBREW_NO_AUTO_UPDATE=1
# actual prompt customization
export PROMPT='%F{green}$(b)%# %F{cyan}%*%f %F{green}%~%f 🐠 '
# enable colors
export CLICOLOR=1
# make ls look pretty
export LSCOLORS=GxFxCxDxBxegedabagaced

