# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Set default editor to VIM
export EDITOR=`which vim`

# PATH
export PATH=$PATH:"~/bin"
export PATH=$PATH:'/var/lib/gems/1.8/bin'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# ignore some commands which could be dangerous to repeat
export HISTIGNORE="rm *"

# Tab / Shift-tab
bind '"\t": menu-complete'
bind '"\e[Z": menu-complete-backward'

# Page up/down
# bind '"\e[5~": history-search-backward'
# bind '"\e[6~": history-search-forward'

# Arrow Shift-left/right
bind '"\e[1;2C": history-search-backward'
bind '"\e[1;2D": history-search-forward'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set 256 color terminal, if supported
if [ -n $DISPLAY ] && [ -e /lib/terminfo/x/xterm-256color ]; then
	export TERM=xterm-256color;
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
	xterm-256color) color_promt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# allows screen to determine name of currently running process
if [ $TERM = 'screen' ]; then
	PS1='\[\033k\]\[\033\\\]'
else
	PS1=''
fi

if [ "$color_prompt" = yes ]; then
	# [TIME] [CWD] (git branch)
	# USER@HOST$
	PS1="\[\e[1;36m\][\T]\[\e[m\] \[\e[0;33m\]\W"'$(__git_ps1)'"\[\e[m\] 
\[\e[0;32m\]\u\[\e[m\]\[\e[0;33m\]@\[\e[m\]\[\e[0;32m\]\h\[\e[m\]\[\e[0;31m\]$\[\e[m\] "$PS1
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '$PS1
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Source alias definitions.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors ~/.dircolors`"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
