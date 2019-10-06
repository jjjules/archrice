# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/jules/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ownTheme"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  tmux
	colored-man-pages
)
if [ "$HOST" = "arch-jules" ]
then
	ZSH_TMUX_AUTOSTART="true"
	ZSH_TMUX_AUTOCONNECT="false"
fi
source $ZSH/oh-my-zsh.sh

# General
eval $( dircolors -b $HOME/.LS_COLORS )
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
# bindkey -s "" 'clear -x\r'	# buggy shortcut -- Do not uncomment as it is
# bindkey "^I" vi-change-eol # Disable Tab completion

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
alias nmr="sudo systemctl restart NetworkManager"
alias nmwr="nmcli device wifi rescan"
alias nmwl="nmcli device wifi list"
alias nmwc="nmcli -a device wifi connect"
alias nmc="nmcli connection -a delete"
alias nms="nmcli connection show"
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
alias cdot="cd ~/.files"
alias dots="vim ~/.files"
alias vrc="v ~/.files/.vimrc"
alias zrc="v ~/.files/.zshrc"
alias brc="v ~/.files/.bashrc"
alias grc="v ~/.files/.gitconfig"
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
alias fzf="fzf --bind=ctrl-h:backward-word,ctrl-l:forward-word"
alias untar="tar -zxvf"
alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner"
alias zshman="man zshzle"
alias pipi="pip install --user -U"

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

# External Programs
# Fzf
if [ -f ~/.fzf.zsh ]
then
	source ~/.fzf.zsh
fi
# Z
if [ -f /usr/share/z/z.sh ]
then
	. /usr/share/z/z.sh
fi
