export ENABLE_CORRECTION='false'
if [ -d $ZSH ];then
  if [ -f $ZSH_CUSTOM/themes/mytheme.zsh-theme ];then
		ZSH_THEME="mytheme"
	else
		ZSH_THEME="robbyrussell"
	fi

	PLUGINS_PATH=$ZSH_CUSTOM/plugins
	plugins=(colored-man-pages thefuck pip)
	for plugin_name ('zsh-autosuggestions' 'zsh-syntax-highlighting' 'autoupdate')
	do
		[ -d $PLUGINS_PATH/$plugin_name ] && plugins+=$plugin_name
	done

  source $ZSH/oh-my-zsh.sh
	[ -d $PLUGINS_PATH/zsh-syntax-highlighting ] && ZSH_HIGHLIGHT_STYLES[path]="none"
fi
[ -d /opt/miniconda3 ] && source /opt/miniconda3/etc/profile.d/conda.sh



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
alias -g V='|vim -'

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

# GNU
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ze="cd $HOME/documents/epfl"
alias zw='cd ~/downloads'
alias zm='cd ~/videos/movies'
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
alias grep="grep --color=auto"
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
alias gpls='git pull --recurse-submodules'
alias gus='git submodule update --init --recursive'
alias gp="git push"
alias gcno="git commit --amend --no-edit"
alias gl="git --no-pager log -10 --oneline --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"
alias gll="git log --all --oneline --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) -%C(red) %an%C(reset)%C(bold yellow)%+d%C(reset)'"

# Dotfiles Shortcuts
alias szrc="source ${ZDOTDIR:-$HOME}/.zshrc"
alias zd="cd $DOTS_PATH"
alias prc="vim $DOTS_PATH/profile"
alias zrc="vim ${ZDOTDIR:-$HOME}/.zshrc"
alias vrc="vim $DOTS_PATH/vim/vimrc"
alias zs="cd $SCRIPTS_PATH"
alias zco="cd ~/.config/"
alias zcu="cd $CUSTOM_PATH"
alias irc="vim ~/.config/i3/config"

# Mounting devices
alias seam="sudo mount -U 7b4ac17c-102b-4bbb-8f6c-b15b0c46a014 /mnt/seagate"
alias seacm="sudo mount -U b9489d7f-ad22-3eff-b11f-0015c086226b /mnt/seagate-chloe -o uid=$UID,gid=$GID,umask=022"
alias keym="sudo mount -U 088D-EFA8 /mnt/usbkey -o uid=$UID,gid=$GID,umask=022"
alias seaum="sudo umount /mnt/seagate"
alias seacum="sudo umount /mnt/seagate-chloe"
alias keyum="sudo umount /mnt/usbkey"

# Utilities
alias todo="vim $CUSTOM_PATH/todo.md"
alias programs="vim $CUSTOM_PATH/misc/programs"
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
alias pipu="pip3 install --user -U"
alias pipua="pip3 list --outdated | sed 1,2d | sed 's/\(\S*\).*$/\1/' | xargs -n1 pip install --user -U"
alias jptl="jupyter lab >/dev/null"
alias jptln="jupyter lab --no-browser >/dev/null"
alias ytdla="youtube-dl -x --audio-format mp3 -o '%(title)s.%(ext)s'"
alias pubip="curl ifconfig.me"
alias dunsttoggle="notify-send 'DUNST_COMMAND_TOGGLE'"
alias wget='wget --hsts-file $HOME/.cache/wget-hsts'
alias webcam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'



##########     Functions     ##########

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
	ffplay -loglevel error -nodisp -loop 0 "$CUSTOM_PATH/misc/radio-alert.mp3" > /dev/null
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

[ ! -f /home/jules/.config/broot/launcher/bash/br ] || source /home/jules/.config/broot/launcher/bash/br
