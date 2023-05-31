# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Alias for vim colors to work pretty in tmux
alias tmux="TERM=screen-256color-bce tmux"

# Some coloring experiments
# https://robotmoon.com/256-colors/
# export PS1="\[$(tput setaf 34)\]\u\[$(tput setaf 40)\]@\[$(tput setaf 46)\]\h \[$(tput setaf 154)\]\w \[$(tput sgr0)\]$ "
TIME="\[$(tput setaf 126)\]\t\[$(tput sgr0)\]"

USER="\[$(tput setaf 147)\]$USER\[$(tput sgr0)\]"

LOCATION='`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
LOCATION="\[$(tput setaf 135)\]$LOCATION\[$(tput sgr0)\]"

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
BRANCH='$(git_branch)'
BRANCH="\[$(tput setaf 159)\]$BRANCH\[$(tput sgr0)\]"
BRANCH="\[$(tput setaf 226)\]:::\[$(tput sgr0)\]"$BRANCH

LEFT_PIPE="\[$(tput bold)$(tput setaf 62)\]|\[$(tput sgr0)\]"
RIGHT_PIPE="\[$(tput bold)$(tput setaf 63)\]|\[$(tput sgr0)\]"

ENDING="\n\[$(tput setaf 40)\]O_o\[$(tput sgr0)\] "

PS1=$TIME$LEFT_PIPE$USER$RIGHT_PIPE$LOCATION$BRANCH$ENDING

PS2='\[$(tput setaf 82)\]\W $ \[$(tput sgr0)\]'

alias ls='ls -alh'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

source ~/.git-completion.bash

eval "$(/opt/homebrew/bin/brew shellenv)"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
export BASH_SILENCE_DEPRECATION_WARNING=1

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

alias ta='tmux a'

export PATH=$(brew --prefix openvpn)/sbin:$PATH

export PATH="$HOME/.poetry/bin:$PATH"

alias ctags='ctags -R --exclude=*.venv*'

. /opt/homebrew/opt/asdf/libexec/asdf.sh
. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export VIRTUALENVWRAPPER_PYTHON=$(asdf which python)
export VIRTUALENVWRAPPER_VIRTUALENV=$(asdf where python)/bin/virtualenv
export WORKON_HOME=~/.virtualenvs
. $(asdf where python)/bin/virtualenvwrapper.sh

export AWS_PROFILE=NIKE.SSO.AdminRole
