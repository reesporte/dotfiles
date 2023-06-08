# ------------------------------
# ZSH OPTIONS
# ------------------------------
# enable tab completion
autoload -Uz compinit && compinit
# enable prompt parameter expansions
setopt PROMPT_SUBST

# history searching
setopt sharehistory # share across terminals
setopt incappendhistory # append after each command
bindkey -e

# terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/homebrew/bin/terraform terraform

# turn off damn beeps
unsetopt BEEP

# ------------------------------
# ALIASES
# ------------------------------
# get battery life
case "$(uname -s)" in
    Darwin*) alias b='pmset -g batt | grep % | cut -d" " -f3 | cut -f2';;
    *) alias b="echo ''";;
esac
# use python3.10 by default
alias py='python3'
alias python='python3'
alias pip='python3 -m pip'
# execute lisp
alias elisp='sbcl --script $1'
# ls
alias la='ls -alh'
alias l='ls'
# vim
alias v='vim'
# clear
alias cls='clear'
alias c='clear'
# ripgrep no ignore
alias g='rg --no-ignore $@'
alias k='rg $@'

# rebuild ctags
alias rc='ctags -R -f tags.dot'

# setup tmux with vim
alias ide="tmux new-session \;  send-keys 'vim .' C-m \; split-window -h \;"

# find and replace
# usage:
# far <old pattern> <new pattern> <files to modify>
function far() {
    gsed -i "s/$1/$2/g" $@[3,-1]
}

# directory find and replace
# usage:
# dfar <old pattern> <new pattern> <directory to recurse>
function dfar() {
    rg -l $1 $3 | xargs gsed -i "s|$1|$2|g"
}

# recursively list all golang files in current directory
function rlg() {
    find . -type f -name "*.go"
}

# be like shakespeare
alias exeunt=exit
alias kys=exit
alias die=exit

alias bruh="echo bruh"

# define a word with Wiktionary's help
define() { curl -s https://en.wiktionary.org/wiki/$1 | htmlq .mw-parser-output -t | less }

# secrets
[ -f ~/.secret_zsh_aliases ] && source ~/.secret_zsh_aliases

# ------------------------------
# EXPORTS
# ------------------------------
# add a bunch of stuff to the path
export PATH=$HOME/.cargo/bin:$HOME/homebrew/opt/postgresql/bin:$HOME/homebrew/opt/openjdk/bin:$HOME/homebrew/opt/libpq/bin:$HOME/homebrew/bin:$HOME/go/bin:$HOME/bin:$PATH
# tell homebrew not to update itself every fucking second
export HOMEBREW_NO_AUTO_UPDATE=1

case "$(uname -s)" in
    Darwin*) export PROMPT='%F{75}$(pmset -g batt | grep % | cut -d" " -f3 | cut -f2)%# %F{75}%~%f ➾ ';;
    *) export PROMPT='%F{75}# %F{75}%~%f ➾ ';;
esac

# enable colors
export CLICOLOR=1
# make ls look pretty
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43'
# set my notes directory for the notes cli
export NOTES_HOME=~/notes

# source fzf keybindings
[ -f ~/homebrew/opt/fzf/shell/key-bindings.zsh ] && source ~/homebrew/opt/fzf/shell/key-bindings.zsh
