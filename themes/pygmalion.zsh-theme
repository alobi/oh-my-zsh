# Yay! High voltage and arrows!

prompt_setup_pygmalion(){
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}●%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}●%{$reset_color%}"

  base_prompt='%{$fg[white]%}[%*]%{$reset_color%}%{$fg[magenta]%}%n%{$reset_color%}%{$fg[yellow]%}@%m%{$reset_color%}%{$fg[white]%}:%{$reset_color%}%{$fg[cyan]$
  git_prompt='%{$fg[white]%} on %{$reset_color%}'
  post_prompt=' %{$fg_bold[cyan]%}❯%{$reset_color%} '

  precmd_functions+=(prompt_pygmalion_precmd)
}

prompt_pygmalion_precmd(){
  local nl=$'\n%{\r%}';

  if [[ -z $(git_prompt_info) ]]; then
    PROMPT="${base_prompt}${nl}${post_prompt}"
  else
    PROMPT="${base_prompt}${git_prompt}$(git_prompt_info)${nl}${post_prompt}"
  fi
}

prompt_setup_pygmalion
