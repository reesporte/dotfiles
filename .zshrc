## SET OPTIONS
# enable tab completion
autoload -Uz compinit && compinit

# history searching
setopt sharehistory # share across terminals
setopt incappendhistory # append after each command
bindkey -e

# making history bigger: https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt bang_hist                 # treat the '!' character specially during expansion.
setopt extended_history          # write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # write to the history file immediately, not when the shell exits.
setopt share_history             # share history between all sessions.
setopt hist_expire_dups_first    # expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # do not display a line previously found.
setopt hist_ignore_space         # don't record an entry starting with a space.
setopt hist_save_no_dups         # don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # remove superfluous blanks before recording entry.
setopt hist_verify               # don't execute immediately upon history expansion.

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
alias v='nvim'
# clear
alias cls='clear'
alias c='clear'
# ripgrep no ignore
alias g='rg --no-ignore $@'
alias k="rg $@ -g '!tags.dot' -g '!vendor'"

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
export PATH=$HOME/.cargo/bin:$HOME/homebrew/opt/postgresql/bin:$HOME/homebrew/opt/openjdk/bin:$HOME/homebrew/opt/libpq/bin:$HOME/go/bin:$HOME/homebrew/bin:$HOME/bin:$PATH

# tell homebrew not to update itself every fucking second
export HOMEBREW_NO_AUTO_UPDATE=1

# make the prompt really simple and dumb
export PROMPT='%~ ⇥ '

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
