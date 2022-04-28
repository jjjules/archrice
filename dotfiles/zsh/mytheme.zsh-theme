# Host name
local loc_hostname=""
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]
then
	loc_hostname="%{$fg[blue]%}$(hostname)%{$reset_color%}:"
fi

# Path
local loc_pwd="$FG[248]%3~%{$reset_color%}"

# Jobs
local loc_jobs="%(1j. [%{$fg[yellow]%}%j%{$reset_color%}].)%{$reset_color%}"

# Git
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function git_prompt() {
	ref=$(git symbolic-ref HEAD 2>/dev/null) || return
	echo "$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_PREFIX} $(git_current_branch)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Full prompt
my_prompt=''
my_prompt+="$loc_hostname"
my_prompt+="$loc_pwd"
PROMPT='${my_prompt}$(git_prompt)${loc_jobs} %(?..%{$fg[red]%})%% %{$reset_color%}'

function get_name_git() {
	if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]
	then
		repo_name="$(git rev-parse --show-toplevel)"
		echo "$FG[208]$(basename $repo_name)%{$reset_color%}"
	fi
}
RPROMPT='$(get_name_git)'
