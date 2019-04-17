# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export EDITOR=vim
export WWW_HOME="google.com"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
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

alias dc="docker-compose"
alias ut="docker-compose run --entrypoint /app/init/run-tests.sh astro"
alias up_astro="docker-compose up -d astro"
alias stop_astro="docker-compose stop astro astro_db"
lint()
{
    docker-compose run --entrypoint /app/init/run-linting.sh astro | perl -p -e 's/^(\.{1})(.*)$/astro$2/g' > errors.err && vim errors.err
}

# screen shortcuts
alias sls="screen -ls"
# send commands to screen window named output
sendscreen()
{
    screen -p output -X stuff "${*}\r"
}
