# Host name
local loc_hostname=""
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]
then
	loc_hostname="%{$fg[orange]%}$(hostname)%{$reset_color%}:"
fi

# Path
local loc_pwd="%{$fg[blue]%}%3~%{$reset_color%}"

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
PROMPT='${my_prompt}$(git_prompt)${loc_jobs} %(!.#.%%) %{$reset_color%}'
