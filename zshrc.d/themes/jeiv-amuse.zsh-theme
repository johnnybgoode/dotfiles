# vim:ft=zsh ts=2 sw=2 sts=2
#  ⏰  ⏱️  ⌚

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg_bold[green]%}⬢ "
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"

# vi-mode
MODE_INDICATOR="%F{green}-N-%f"
#INSERT_MODE_INDICATOR="%F{yellow}I) %f"
#  %{$fg_bold[red]%}[%*]%{$reset_color%}

#cols="${$(pwd)#/Users/$(id -un)/*}" | wc -c `
#PS1="\$(printf '_'%.0s {1..$cols}) \n.."
# \$(nvm_prompt_info)

PS1="
%{$fg_bold[green]%}%~%{$reset_color%}\$(git_prompt_info) ⏱️ %{$fg_bold[red]%}%*%{$reset_color%}
%{$fg[green]%}$ %{$reset_color%}"

#RPS1="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
#RPS1+="%{$fg_bold[red]%}%*%{$reset_color%}"
export RPS1
