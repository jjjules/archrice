export ENABLE_CORRECTION='false'
if [ -d $ZSH ];then
  if [ -f $ZSH_CUSTOM/themes/mytheme.zsh-theme ];then
		ZSH_THEME="mytheme"
	else
		ZSH_THEME="robbyrussell"
	fi

	PLUGINS_PATH=$ZSH_CUSTOM/plugins
	plugins=(colored-man-pages thefuck fzf pip docker docker-compose)
	for plugin_name ('zsh-autosuggestions' 'zsh-syntax-highlighting' 'autoupdate')
	do
		[ -d $PLUGINS_PATH/$plugin_name ] && plugins+=$plugin_name
	done

  source $ZSH/oh-my-zsh.sh
	[ -d $PLUGINS_PATH/zsh-syntax-highlighting ] && ZSH_HIGHLIGHT_STYLES[path]="none"
fi


# Git fuzzy plugin
if [ -d $ZSH_CUSTOM/plugins/git-fuzzy ]; then
	export PATH="$ZSH_CUSTOM/plugins/git-fuzzy/bin:$PATH"
	export GIT_FUZZY_STATUS_ADD_KEY="Ctrl-A"
	export GIT_FUZZY_STATUS_EDIT_KEY="Ctrl-E"
	export GIT_FUZZY_STATUS_COMMIT_KEY="Ctrl-T"
	export GIT_FUZZY_STATUS_RESET_KEY="Ctrl-R"

	alias gzs='git fuzzy status'
fi


eval $( dircolors -b $DOTS_PATH/ls_colors )

##########  Key Bindings  ##########

# bindkey -v
# bindkey "^?" backward-delete-char
# bindkey "^W" backward-kill-word
# bindkey "^U" backward-kill-line
bindkey '^@'	autosuggest-execute
bindkey '^Z'	undo
bindkey ',' delete-char
bindkey '^O'	kill-line
bindkey '^H'	vi-backward-word
bindkey 'Od'	vi-backward-word
bindkey 'h'	backward-char
bindkey '^J'	history-search-forward
bindkey '^K'	history-search-backward
bindkey 'l'	forward-char
bindkey '^L'	vi-forward-word
bindkey 'Oc'	vi-forward-word
bindkey 'e'	edit-command-line
bindkey 'm' run-help
bindkey -r ''
## Replace arrows by vim bindings in menu selection
zstyle ':completion:*' menu-select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^[[A' undefined-key
#bindkey -M menuselect '^[[B' -r
#bindkey -M menuselect '^[[C' -r
#bindkey -M menuselect '^[[D' -r
## Allow cycle through argument of command using M-:
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[:" copy-earlier-word



##########     Aliases     ##########

# Pipe
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g V='| vim -'
alias -g Z='| zathura -'
alias -g X='| xsel -b'

# Arch
alias pm='pacman'
alias pms='sudo pacman -S'
alias pmss='sudo pacman -Ss'
alias pmr='sudo pacman -Rns'
alias pmu='sudo pacman -Syyu'
alias parus='paru -S'
alias paruss='paru -Ss'
alias parur='paru -Rns'
alias paruu='paru -Syyu'
alias paruau='paru -Sayyu'

# GNU
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias zw='cd ~/downloads'
alias zv='cd ~/videos/movies'
alias zmu='cd ~/musics/'
alias zi='cd ~/images'
alias zmt='cd /mnt'
alias d='dirs -v'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=tty -v --group-directories-first'
alias la='ls -a'
alias l='\ls --color=tty -v -Alhtr'
alias sudo='sudo '
alias hg='history | grep'
#alias less='less -F -X -b -1'
alias diff="diff --color=auto"
alias diffc="diff --color=always"
alias grep="grep --color=auto"
alias du="dust"
alias psg="ps aux | grep $@"
alias ka="killall"
alias km="killall mailspring"
alias kz="killall zoom"
alias kb="kill $(ps aux | grep '/bin/bash.*bch$' | awk '{print $2}')"

# Wifi
alias nmr="nmcli device wifi rescan"
alias nml="nmcli device wifi list"
alias nmc="nmcli -a device wifi connect"
alias nmu="nmcli -p con up"

# Git
alias gs='git status -s -b'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gpls='git pull --recurse-submodules'
alias gsu='git submodule update --init --recursive --merge'
alias gp="git push"
alias gcno="git commit --amend --no-edit"
alias gl="git --no-pager log -10 --oneline --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"
alias gll="git log --all --oneline --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"

# Dotfiles Shortcuts
alias szrc="source ${ZDOTDIR:-$HOME}/.zshrc"
alias prc="vim $DOTS_PATH/profile"
alias zrc="vim ${ZDOTDIR:-$HOME}/.zshrc"
alias vrc="vim $DOTS_PATH/vim/vimrc"
alias irc="vim ~/.config/i3/config"

# Mounting devices
alias seam="sudo mount -U 7b4ac17c-102b-4bbb-8f6c-b15b0c46a014 /mnt/seagate"
alias seacm="sudo mount -U b9489d7f-ad22-3eff-b11f-0015c086226b /mnt/seagate-chloe -o uid=$UID,gid=$GID,umask=022"
alias keym="sudo mount -U 088D-EFA8 /mnt/usbkey -o uid=$UID,gid=$GID,umask=022"
alias seaum="sudo umount /mnt/seagate"
alias seacum="sudo umount /mnt/seagate-chloe"
alias keyum="sudo umount /mnt/usbkey"

# Utilities
alias todo="vim $RICE_PATH/todo.md"
alias flv='fl --vim'
alias ccp='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | xsel -ib'
alias ocp='fc -e - | head -n1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | xsel -ib'
alias mocp='fc -e - | xsel -ib'

# Special programs
alias vr="vim -c 'History'"
alias vf="vim -c 'Files'"
alias sv="sudo vim"
alias gvim="vim"
alias lf="lfub"
alias tree='tree -a -I ".git|venv|.venv|*.class"'
alias cal="cal -m"
alias ghs="\gs"
alias untar="tar -zxvf"
alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner"
alias archey="archey3 --config=$HOME/.config/archey3/archey3.conf"
alias zshman="man zshzle"
alias jptl="jupyter lab >/dev/null"
alias jptln="jupyter lab --no-browser >/dev/null"
alias ytdla="youtube-dl -x --audio-format mp3 -o '%(title)s.%(ext)s'"
alias pubip="curl ifconfig.me"
alias dunsttoggle="notify-send 'DUNST_COMMAND_TOGGLE'"
alias wget='wget --hsts-file $HOME/.cache/wget-hsts'
alias webcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
unalias pip
alias mm='micromamba'
alias exportvscode="for f (keybindings.json settings.json); do
                      cp '$XDG_CONFIG_HOME/VSCodium/User/$f' '$RICE_PATH/vscode-$f'\
                    done"
alias draglastshot="latestindir \"$HOME/images/screenshots/\" | xargs dragon-drop"
alias lastdl="latestindir $HOME/downloads"
alias draglastdl="lastdl | xargs dragon-drop"
alias mvlastdl="lastdl | xargs -I {} mv {}"
alias mvlastshot="latestindir \"$HOME/images/screenshots/\" | xargs -I {} mv {}"
alias list-aws-instances='aws ec2 describe-instances --region eu-central-1 --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,InstanceId:InstanceId,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --filters "Name=instance-state-name,Values=running" --output table'
alias rundynamolocal="cd /home/jules/documents/magma/tutor/dynamodb/main-db/ && java -Djava.library.path=$DYNAMODBLOCALLOCATION/DynamoDBLocal_lib -jar $DYNAMODBLOCALLOCATION/DynamoDBLocal.jar -sharedDb & cd -"


##########     Functions     ##########

function scalehdmi() { xrandr --output HDMI1 --scale ${1}x${1} }
function mdz() { mdcompile -p $1 Z }
function mmrepo() { mm activate $(cat .micromamba-env)  }
function dockerconnect() { 
	local _shell
	if [ $# -gt 0 ]
	then
		_shell=$1
	else
		_shell=bash
	fi
	cid=$(docker ps | tail -n +2 | fzf | awk '{print $1}')
	[ -z $cid ] || sudo docker exec -it $cid /bin/$_shell
}
function work() {
	if [ $# -eq 0 ]
	then
		vim /home/jules/documents/magma/work_hours
		return 0
	elif [ $1 = start -o $1 = stop ]
	then
		line="$1: $(date '+%d.%m.%y %H:%M:%S')"
	elif [ $1 = new ]
	then
		line="\nstart: $(date '+%d.%m.%y %H:%M:%S')"
	else
		return 1
	fi

	echo "$line" >> $HOME/documents/magma/work_hours
}
function compute_hours() {
	/home/jules/documents/magma/compute_hours.py
}
function ari() {
	if [ $# -eq 1 ]; then
		arg="-$1"
	fi

	mm activate "ari9000$arg"
	cd ~/documents/magma/ariapi-qgen
}
function arirun() {
	ari $* && python run.py
}
function ariworker() {
	ari $* && redis-server & python worker.py
}
function showariblue() {
	COLS='State.Name, InstanceType, InstanceId, PublicDnsName, LaunchTime'
	ENV_NAMES=ariblue-worker,ariblue,ariblue-api,ariblue-recall-api
	echo Ari Blue environments: $ENV_NAMES
	echo Columns: $COLS
	aws ec2 describe-instances \
	--filters 'Name=tag-key,Values=elasticbeanstalk:environment-name' "Name=tag-value,Values=$ENV_NAMES" \
	--query "Reservations[].Instances[].[Tags[?Key==\`Name\`].Value | [0], $COLS]" \
	--output table --no-paginate | less -FX
}
function latestindir() {
	if [ $# -ge 1 ]
	then
		dir="$1"
	else
		dir='.'
	fi
	print -lr -- $dir/**/$str*(om[1])
}

function mvsync() {   rsync -aP --remove-source-files $1 $2 && rm -r $1   }
function cpsync() {	  rsync -aP $1 $2   }
function weather(){   curl wttr.in/$1   }
function twoshot() {
	oneshot $1
	if [ $? -eq 0 ]; then
		oneshot $1
	fi
}
function gr() {  	cd $(git rev-parse --show-toplevel)   }
function gac() {
	git add $(git rev-parse --show-toplevel)
	git commit
}
function grsa() {   git restore --staged $(git rev-parse --show-toplevel)   }
function gsjoin() {  	/usr/bin/gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dFIXEDMEDIA -dPDFFitPage -sPAPERSIZE=a4 -sOutputFile="$1" "${@:2}"   }
# Compress and Extract functions (https://forums.archlinux.fr/viewtopic.php?p=85628#p85628)
xtrct () {
	# Usage: xtrct COMPRESSED_FILE
	if [ -f $1 ] ; then
		case $1 in
			*.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
			*.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
			*.rar)		unrar x $1 && cd $(basename "$1" .rar) ;;
			*.tar)		tar xvf $1 && cd $(basename "$1" .tar) ;;
			*.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
			*.tar.gz)	tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
			*.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
			*.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
			*.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
			*.zip)		unzip $1 && cd $(basename "$1" .zip) ;;
			*.Z)		uncompress $1 && cd $(basename "$1" .Z) ;;
			*.7z)		7z x $1 && cd $(basename "$1" .7z) ;;
			*)		echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "Error: '$1' is not a valid file!"
		exit 0
	fi
}
cmpr () {
	# Usage: cmpr COMPRESSION_TYPE FILE_OR_DIRECTORY
	case "$1" in
		tar.bz2|.tar.bz2)	tar cvjf "${2%%/}.tar.bz2" "${2%%/}/" ;;
		tbz2|.tbz2)			tar cvjf "${2%%/}.tbz2" "${2%%/}/" ;;
		tbz|.tbz)			tar cvjf "${2%%/}.tbz" "${2%%/}/" ;;
		tar.gz|.tar.gz)		tar cvzf "${2%%/}.tar.gz" "${2%%/}/" ;;
		tar.Z|.tar.Z)		tar Zcvf "${2%%/}.tar.Z" "${2%%/}/" ;;
		tgz|.tgz)			tar cvjf "${2%%/}.tgz" "${2%%/}/" ;;
		tar|.tar)			tar cvf "${2%%/}.tar" "${2%%/}/" ;;
		rar|.rar)			rar a "${2%%/}.rar" "${2%%/}/" ;;
		zip|.zip)			zip -r9 "${2}.zip" "$2" ;;
		7z|.7z)				7z a "${2}.7z" "$2" ;;
		lzo|.lzo)			lzop -v "$2" ;;
		gz|.gz)				gzip -v "$2" ;;
		bz2|.bz2)			bzip2 -v "$2" ;;
		xz|.xz)				xz -v "$2" ;;
		lzma|.lzma)			lzma -v "$2" ;;
		*)	echo "Error, please go away.";;
	esac
}
function stopwatch(){
  date1=`date +%s`;
   while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
   done
}
function timer(){
	if [ $# -gt 1 ];then
		sec="$(echo $1'*60 +' $2 | bc)"
	elif [ $# -eq 1 ]; then
		sec=$1
	else
		exit 0
	fi
	date1=$((`date +%s` + $sec))
	while [ "$date1" -ge `date +%s` ]
	do
		echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
		sleep 0.1
	done
	[[ $2 = 's' ]] && return 0
	dunstify -u normal -r 30503 "End of timer"
	ffplay -loglevel error -nodisp -loop 0 "$RICE_PATH/misc/radio-alert.mp3" > /dev/null
}
if [ -f /usr/bin/pass ];then
	function pass() {
		/usr/bin/pass $@
		if [[ $?  -eq 0 && "$@" =~ '-c' ]]
		then
			clipdel -d "$(clippaste)"
		fi
	}
fi

# Change cursor shape for different vi modes. (Luke's)
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

eval "$(lua "$SCRIPTS_PATH/z.lua/z.lua" --init zsh enhanced once echo)"
function space() { z space && mmrepo }



# fzf
#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/ key-bindings.zsh
#
# - $FZF_TMUX_OPTS
# - $FZF_CTRL_T_COMMAND
# - $FZF_CTRL_T_OPTS
# - $FZF_CTRL_R_OPTS
# - $FZF_ALT_C_COMMAND
# - $FZF_ALT_C_OPTS

# Key bindings
# ------------

# The code at the top and the bottom of this file is the same as in completion.zsh.
# Refer to that file for explanation.
if 'zmodload' 'zsh/parameter' 2>'/dev/null' && (( ${+options} )); then
  __fzf_key_bindings_options="options=(${(j: :)${(kv)options[@]}})"
else
  () {
    __fzf_key_bindings_options="setopt"
    'local' '__fzf_opt'
    for __fzf_opt in "${(@)${(@f)$(set -o)}%% *}"; do
      if [[ -o "$__fzf_opt" ]]; then
        __fzf_key_bindings_options+=" -o $__fzf_opt"
      else
        __fzf_key_bindings_options+=" +o $__fzf_opt"
      fi
    done
  }
fi

'emulate' 'zsh' '-o' 'no_aliases'

{

[[ -o interactive ]] || return 0

# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
	prune_patterns=('./\.*' '*/\.git*')
	prune_patterns_formatted="$(printf "-path '%s' -prune -o " "${prune_patterns[@]}")"
	local cmd="find -L . $prune_patterns_formatted  \
		-path '*/\.dotfiles/*' -print \
		-o -type f -print \
		-o -type d -print \
		-o -type l -print 2> /dev/null | cut -b3-"
  # local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
  #   -o -type f -print \
  #   -o -type d -print \
  #   -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_T_OPTS-}" $(__fzfcmd) -m "$@" | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
  echo
  return $ret
}

__fzfcmd() {
  [ -n "${TMUX_PANE-}" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "${FZF_TMUX_OPTS-}" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N            fzf-file-widget
bindkey -M emacs '^T' fzf-file-widget
bindkey -M vicmd '^T' fzf-file-widget
bindkey -M viins '^T' fzf-file-widget

# ALT-C - cd into the selected directory
fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-}" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N             fzf-cd-widget
bindkey -M emacs 'x' fzf-cd-widget
bindkey -M vicmd 'x' fzf-cd-widget
bindkey -M viins 'x' fzf-cd-widget

# CTRL-R - Paste the selected command from history into the command line
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} ${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N            fzf-history-widget
bindkey -M emacs '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

} always {
  eval $__fzf_key_bindings_options
  'unset' '__fzf_key_bindings_options'
}

fzf-last-word-widget() {
  local POSITION RECALL_ARGUMENT
  if [[ ! -z $NUMERIC ]]; then
    POSITION=-${NUMERIC}
  else
    POSITION=-1
  fi

  histlist=$(
    for histitem ("${(@f)$(fc -l 1)}") {
      histwords=(${(z)histitem})
      print -- $histwords[$POSITION]
    }
  )
  RECALL_ARGUMENT=$(print $histlist | fzf --tac +s -e)
  if [[ ! -z $RECALL_ARGUMENT ]]; then
    LBUFFER="${LBUFFER}${(q)RECALL_ARGUMENT}"
    zle redisplay
  fi
}
zle -N        fzf-last-word-widget
bindkey -M emacs '^G' fzf-last-word-widget
bindkey -M vicmd '^G' fzf-last-word-widget
bindkey -M viins '^G' fzf-last-word-widget







# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/jules/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/jules/.local/share/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

