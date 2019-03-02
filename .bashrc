# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export EDITOR=vim
export WWW_HOME="google.com"
set -o vi
bind -m vi-insert "\C-l":clear-screen

# git shortcuts
alias s="git status"
alias d="git diff"
alias ga="git add"
alias gbv="git branch -v"
alias gf="git ls-files"
alias gg="git grep"
alias gsno="git show --name-only"
# git log short last 5
gls()
{
    default_arg="-5"
    git log --oneline "${1:-${default_arg}}"
}

# screen shortcuts
alias sls="screen -ls"
# send commands to screen window named output
sendscreen()
{
    screen -p output -X stuff "${*}\r"
}
