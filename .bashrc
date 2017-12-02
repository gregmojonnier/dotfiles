# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export EDITOR=vim
set -o vi
bind -m vi-insert "\C-l":clear-screen

# git shortcuts
alias s="git status"
alias d="git diff"
alias ga="git add"
alias gbv="git branch -v"
alias gf="git ls-files"
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
