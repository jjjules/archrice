# Host name
local loc_hostname=""
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]
then
	loc_hostname="%{$fg[green]%}$(hostname)%{$reset_color%}:"
fi

# Path
local loc_pwd="%{$fg[blue]%}%3~%{$reset_color%}"
#"%{$fg[green]%}`%~ | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`%{$reset_color%}"

# Jobs
local loc_jobs="%(1j. [%{$fg[yellow]%}%j%{$reset_color%}].)%{$reset_color%}"
# if [ 1j ]
# then
# 	loc_jobs="\[${loc_jobs}\] "
# fi
#local pc_jobs="$fg[yellow]"
#local p_jobs=  "%(1j. %{${pc_jobs}%}jj%{$reset_color%}.) "
#local loc_jobs="%(%{$fg[yellow]%}%jobs%{$reset_color%}.) "

# Git
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

#local git_prompt="$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_PREFIX} $(current_branch)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
function git_prompt() {
	ref=$(git symbolic-ref HEAD 2>/dev/null) || return
	echo "$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_PREFIX} $(current_branch)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Full prompt
my_prompt=''
my_prompt+="$loc_hostname"
my_prompt+="$loc_pwd"
PROMPT='${my_prompt}$(git_prompt)${loc_jobs} %(!.#.%%) %{$reset_color%}'

# Git
#ZSH_THEME_GIT_PROMPT_PREFIX="" #%{$fg[green]%}%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX=""
#ZSH_THEME_GIT_PROMPT_PREFIX="‹"
#ZSH_THEME_GIT_PROMPT_SUFFIX="›$reset_color"
#ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
#ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}%{$reset_color%I} "
