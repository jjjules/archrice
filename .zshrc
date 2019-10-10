# Oh-My-Zsh
export ZSH="$HOME/.config/.oh-my-zsh"
export FZF_DEFAULT_OPTS='--bind=ctrl-h:backward-word,ctrl-l:forward-word'
ZSH_THEME="ownTheme"
HYPHEN_INSENSITIVE="true"
_Z_DATA="$HOME/.cache/z/.z"
plugins=(
	z
  zsh-autosuggestions
	colored-man-pages
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# General
eval $( dircolors -b $HOME/.dots/.LS_COLORS )
source /home/jules/.profile
export PATH="/home/jules/.local/bin:$PATH"	# pip scripts directory
export EDITOR="vim"
export VISUAL="vim"

# Key Bindings
bindkey '^O' kill-line
bindkey '^@' autosuggest-execute
bindkey '^P' autosuggest-accept
bindkey '^H' backward-word
bindkey 'h' backward-char
bindkey 'l' forward-char
bindkey '^L' forward-word
bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward

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
alias k1="kill %1"
alias k2="kill %2"
## Wifi
alias nmr="nmcli device wifi rescan"
alias nml="nmcli device wifi list"
alias nmc="nmcli -a device wifi connect"
alias nms="nmcli connection show"
alias nmw="nmcli device wifi"
## Git
alias g="git"
alias gs="g status -s -b"
alias ga="g add"
alias gc="g commit"
alias gd="g diff"
alias gf="g fetch"
alias gfp="g fetch --prune"
alias gb="g branch"
alias gpl="g pull"
alias gp="g push"
alias gl="g --no-pager log -10 --oneline --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"
alias gll="g log --oneline --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"
## EPFL
### cds
alias ge="cd $EPFL_DIR"
alias gea="cd ${EPFL_DIR}/ada"
alias gei="cd ${EPFL_DIR}/isp"
alias gem="cd ${EPFL_DIR}/ml"
alias gen="cd ${EPFL_DIR}/nlp"
alias ges="cd ${EPFL_DIR}/sds"
### Misc
alias vtd="vim ${EPFL_DIR}/todo.md"
alias sdock="sudo docker"
alias jptn="jupyter notebook"
alias jptl="jupyter lab"
alias vpnep="sudo /usr/bin/openconnect -b vpn.epfl.ch -u gottraux"
## Dots Shortcuts
alias szrc="source ~/.zshrc"
alias cdot="cd ~/.dots"
alias dots="vim ~/.dots"
alias vrc="v ~/.dots/.vimrc"
alias zrc="v ~/.dots/.zshrc"
alias brc="v ~/.dots/.bashrc"
alias grc="v ~/.dots/.gitconfig"
alias cdscr="cd ~/scripts"
alias scripts="v ~/scripts"
alias cdc="cd ~/.config/"
alias qrc="v ~/.config/qutebrowser/config.py"
alias irc="v ~/.config/i3/config"
alias rrc="v ~/.config/ranger/rc.conf"
alias xrc="v ~/.Xdefaults"
alias todo="v ${EPFL_DIR}/todo.md" # In EPFL directory for synchronization purpose
## Others
alias v="vim"
alias gvim="vim"
alias ra="ranger"
alias untar="tar -zxvf"
alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner"
alias zshman="man zshzle"
alias piu="pip install --user -U"

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
function gr() {
	cd $(git rev-parse --show-toplevel)
}
function gac() {
	cd $(git rev-parse --show-toplevel)
	git add .
	cd -
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
