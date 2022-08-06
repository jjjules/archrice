export HISTFILE="$XDG_DATA_HOME/zsh/zsh_history"
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
export ZSH="$XDG_DATA_HOME/zsh/oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_COMPDUMP="$XDG_DATA_HOME/zsh/zcompdump"

[ -f $HOME/.magma_envs ] && source $HOME/.magma_envs
