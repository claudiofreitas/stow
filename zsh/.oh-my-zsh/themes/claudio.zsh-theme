local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local ret_status=""
PROMPT='%F{blue} %n %F{green}  %m %F{yellow}  %~ %f$(git_prompt_info)
%F{red}> %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
