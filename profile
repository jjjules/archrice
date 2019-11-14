export EPFL_DIR="$HOME/documents/epfl/ma1"
export PATH="$(find "$HOME/scripts" -type d -name '.git' -prune -o -type d -name '*' | grep -v '\.git' | tr '\n' ':'):$PATH"
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"
export HISTFILE="$HOME/.history/zsh"
export HISTSIZE=100000
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 } # Avoid putting wrong command on history stack
export LESSHISTFILE="$HOME/.history/less"
export HYPHEN_INSENSITIVE="true"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER='/usr/bin/qutebrowser'
