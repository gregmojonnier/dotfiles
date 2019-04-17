# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export PATH=/usr/local/bin:$PATH
PS1="\A \w$"
PS1='\w$ '
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
