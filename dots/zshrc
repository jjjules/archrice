# Oh-My-Zsh
export ZSH="$HOME/.config/zsh/oh-my-zsh"
export FZF_DEFAULT_OPTS='--bind=ctrl-h:backward-word,ctrl-l:forward-word'
ZSH_THEME="ownTheme"
_Z_DATA="$HOME/.cache/z/z_data"
plugins=(
	z
  zsh-autosuggestions
	colored-man-pages
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_STYLES[path]="none" # Do not highlight path url-like

# General
eval $( dircolors -b $HOME/.dots/ls_colors )
source /home/jules/.profile
export PATH="$HOME/.local/bin:$PATH"	# pip scripts directory
export JUPYTER_CONFIG_DIR="$HOME/.config/jupyter"
export IPYTHONDIR="$HOME/.config/ipython"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm"

# Key Bindings
bindkey '^O' kill-line
bindkey '^@' autosuggest-execute
bindkey '^P' autosuggest-accept
bindkey '^H' backward-word
bindkey 'h' backward-char
bindkey '^J' history-beginning-search-forward
bindkey '^K' history-beginning-search-backward
bindkey 'l' forward-char
bindkey '^L' forward-word
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey 'e' edit-command-line

# Aliases
## Arch
alias pm="pacman"
alias pms="sudo pacman -S $1"
alias pmr="sudo pacman -Rns $1"
alias pmy="sudo pacman -Syu"
## GNU
### Dirs and Files
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdw="cd ~/downloads"
alias d="dirs -v"
alias cp="nocorrect cp"
alias mkd="nocorrect mkdir -pv"
alias mv="nocorrect mv"
alias ls="ls --color=tty -v --group-directories-first"
alias la="ls -a"
alias ll="ls -alh"
alias lsd="ls .*"
alias rm="rm -I"
alias du="du -h"
alias tree='tree -a -I ".git|venv|.venv|*.class"'
### Process management
alias sudo="sudo "
alias c="clear"
alias j="jobs"
alias h="history"
alias hg="history | grep $@"
	#alias less='less -F -X -b -1'
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias psg="ps aux | grep $@"
alias ka="killall"
alias k="kill"
## Wifi
alias nmr="nmcli device wifi rescan"
alias nml="nmcli device wifi list"
alias nmc="nmcli -a device wifi connect"
alias nms="nmcli connection show"
alias nmw="nmcli device wifi"
## Git
alias gs="git status -s -b"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gf="git fetch"
alias gfp="git fetch --prune"
alias gb="git branch"
alias gpl="git pull"
alias gp="git push"
alias gl="git --no-pager log -10 --oneline --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"
alias gll="git log --oneline --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"
## EPFL
### cds
alias ge="cd $EPFL_DIR"
alias gea="cd ${EPFL_DIR}/ada"
alias geap="cd ${EPFL_DIR}/ada/project"
alias gei="cd ${EPFL_DIR}/isp"
alias gem="cd ${EPFL_DIR}/ml"
alias gem2="cd $EPFL_DIR/ml/ml-project2"
alias gen="cd ${EPFL_DIR}/nlp"
alias ges="cd ${EPFL_DIR}/sds"
### Misc
alias vtd="vim ${EPFL_DIR}/todo.md"
alias sdock="sudo docker"
alias jptn="jupyter notebook >/dev/null"
alias jptl="jupyter lab >/dev/null"
alias vpnep="sudo /usr/bin/openconnect -b vpn.epfl.ch -u gottraux"
alias clust040="ssh gottraux@iccluster040.iccluster.epfl.ch"
## Dots Shortcuts
alias szrc="source ~/.zshrc"
alias gdot="cd ~/.dots"
alias dots="vim ~/.dots"
alias xrc="v ~/.dots/xinitrc"
alias prc="v ~/.dots/profile"
alias zrc="v ~/.dots/zshrc"
alias vrc="v ~/.dots/vimrc"
alias brc="v ~/.dots/bashrc"
alias grc="v ~/.dots/gitconfig"
alias gscr="cd ~/scripts"
alias scripts="v ~/scripts"
alias cdc="cd ~/.config/"
alias qrc="v ~/.config/qutebrowser/config.py"
alias qrc2="v ~/.config/qutebrowser/config-default.py"
alias irc="v ~/.config/i3/config"
alias rrc="v ~/.config/ranger/rc.conf"
alias todo="v ${EPFL_DIR}/todo.md" # In EPFL directory for synchronization purpose
## Others
alias g="z"
alias v="vim"
alias gvim="vim"
alias ra="ranger"
alias untar="tar -zxvf"
alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner"
alias archey="archey3 --config=$HOME/.config/archey3/archkey3.cfg"
alias zshman="man zshzle"
alias pipu="pip install --user -U"

# Functions
function o() {
	nohup xdg-open "$1" &>/dev/null & disown
}
function mvep() {
	mv "$@" "$(du -a -d 3 $EPFL_DIR | awk '{print $2}' | grep -Fv . | fzf)"
}
function cpep() {
	cp "$@" "$(du -a -d 3 $EPFL_DIR | awk '{print $2}' | grep -Fv . | fzf)"
}
function touchx() {
	touch "$1"
	chmod +x "$1"
}
function gr() {
	cd $(git rev-parse --show-toplevel)
}
function gac() {
	cd $(git rev-parse --show-toplevel)
	git add .
	cd -
	git restore --staged "$@"
	git commit
}
function gamno() {
	cd $(git rev-parse --show-toplevel)
	git add .
	cd -
	git commit --amend --no-edit
}
function zathuratab() {
	tabbed -c zathura "$@" -e
}
function playm() {
	ffplay "$(find ~/music -type f | fzf)" &> /dev/null
}

# InfoSec Aliases and Functions
ISP_DIR="/home/jules/documents/epfl/ma1/isp/homework/attacks"
ISP_SSH_DIR="/home/user/sploits"
function ispc {
	sshpass -p user ssh -p 2222 user@127.0.0.1
}
function isps {
	scp -P 2222 "$1" user@127.0.0.1:${ISP_SSH_DIR}
}
function ispr {
	scp -P 2222 "user@127.0.0.1:${ISP_SSH_DIR}/$1" ${ISP_DIR}
}
function ispra {
	scp -P 2222 "user@127.0.0.1:$1" ${ISP_DIR}
}
# Ada cluster
alias sshrp="ssh -N -L 8080:localhost:8080 gottraux@iccluster040.iccluster.epfl.ch"
