# Host name
local loc_hostname=""
if [[ "$(hostname)" = "arch-jules" ]];
then
else
	loc_hostname="%{$fg[blue]%}$(hostname)%{$reset_color%}:"
fi

# Path
local loc_pwd="%{$fg[blue]%}%3~%{$reset_color%}"
#"%{$fg[green]%}`%~ | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`%{$reset_color%}"

# Jobs
#local pc_jobs="$fg[yellow]"
#local p_jobs=  "%(1j. %{${pc_jobs}%}jj%{$reset_color%}.) "
#local loc_jobs="%(%{$fg[yellow]%}%jobs%{$reset_color%}.) "

# Full prompt
my_prompt=''
my_prompt+="$loc_hostname"
my_prompt+="$loc_pwd"
PROMPT=' ${my_prompt} $(git_prompt_info) %(!.#.%%) %{$reset_color%}'

# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}@" #%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} x%{$reset_color%}"
