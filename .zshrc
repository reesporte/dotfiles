# ------------------------------
# ZSH OPTIONS
# ------------------------------
# enable tab completion
autoload -Uz compinit && compinit
# enable prompt parameter expansions
setopt PROMPT_SUBST

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
alias py='python3.10'
alias python='python3.10'
alias python3='python3.10'
alias pip='pip3.10'
alias pip3='pip3.10'
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
    rg -l $1 $3 | xargs gsed -i "s/$1/$2/g"
}

# be like shakespeare
alias exeunt=exit
alias kys=exit
alias die=exit

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
# actual prompt customization
export PROMPT='%F{35}$(b)%# %F{33}%~%f ➾ '
# enable colors
export CLICOLOR=1
# make ls look pretty
export LSCOLORS=GxFxCxDxBxegedabagaced
# set my notes directory for the notes cli
export NOTES_HOME=~/notes
