## SET OPTIONS
# enable tab completion
autoload -Uz compinit && compinit

# history searching
setopt sharehistory # share across terminals
setopt incappendhistory # append after each command
bindkey -e

# terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/homebrew/bin/terraform terraform

# turn off damn beeps
unsetopt BEEP

## ALIASES AND FUNCTIONS
# get battery life
case "$(uname -s)" in
    Darwin*) alias b='pmset -g batt | grep % | cut -d" " -f3 | cut -f2';;
esac

# python aliases
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

alias exeunt=exit
alias kys=exit
alias die=exit

__mike='
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣰⣼⣿⣿⠿⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⢠⣿⣿⡿⢿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⣈⣤⠔⠒⢶⣶⣍⠁⢀⣴⣶⠖⠒⠲⣤⡉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⣿⣿⣠⣘⣿⣇⠀⠀⠀⣿⣷⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣶⣴⣾⠟⠹⠿⠿⠟⠻⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡷⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣷⣶⣤⣄⣀⡀⠀⢀⣠⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿
⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿
⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⢸⣿⣿⣿
⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⡿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⣾⡼⣿⣿⣿
⣿⣿⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⢸⡇⣿⣿⣿
⣿⡇⠀⠀⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠙⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⠿⠛⢻⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⡀⠈⡇⢿⣿⣿
⣿⠃⠀⠀⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⠟⠀⠀⠀⠀⣼⣿⠀⢰⢸⣿⣿
⣿⠀⠀⢸⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⠛⠉⠀⠀⠀⣠⣾⣿⣿⣶⣾⢸⣿⣿
⣿⢀⣤⣼⣿⣿⣿⣿⣿⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⢸⣿⣿
⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⢿⣿⢸⣿⣿
⣿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢠⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⢸⣿⣿
⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣾⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⡆⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠈⣿⣿
⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⠀⣿⣿
⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⡆⢻⣿
⡟⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⢿
⡇⠀⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠜
⠁⠀⣿⣿⡆⢿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⡿⠀
⡀⡀⢻⣿⣿⣌⢿⣿⣿⣿⣿⣿⣿⣿⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣾⣿⠁⢠
⣇⢷⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⢀⣾
⣿⣮⡳⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣋⣡⣶⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣼⣿⣿⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⡟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠛⢋⣴⣿⡿⠟⡀⢸⣿⠿⣫⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⡇⠀⣿⣿⣿⣄⠿⠿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣝⣿⣇⣤⣬⣝⣻⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿
'
alias bruh='echo $__mike'

# secrets
[ -f ~/.secret_zsh_aliases ] && source ~/.secret_zsh_aliases

## EXPORTS
# add a bunch of stuff to the path
export PATH=$HOME/.cargo/bin:$HOME/homebrew/opt/postgresql/bin:$HOME/homebrew/opt/openjdk/bin:$HOME/homebrew/opt/libpq/bin:$HOME/homebrew/bin:$HOME/go/bin:$HOME/bin:$PATH

# tell homebrew not to update itself every fucking second
export HOMEBREW_NO_AUTO_UPDATE=1

# make the prompt really simple and dumb
export PROMPT='⇥ '

# enable colors
export CLICOLOR=1

# make ls look boring
export LSCOLORS=XXxxxxxxxxxxxxxxxxXXXX
export LS_COLORS='di=1;0;1:ln=0:so=0:pi=0:ex=0:bd=0:cd=0:su=0:sg=0:tw=1;0;1:ow=1;0;1'

# set my notes directory for the notes cli
export NOTES_HOME=~/notes

## EXTRA SOURCES
# source fzf keybindings
[ -f ~/homebrew/opt/fzf/shell/key-bindings.zsh ] && source ~/homebrew/opt/fzf/shell/key-bindings.zsh
