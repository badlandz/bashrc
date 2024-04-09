# This is Robert W. Current's custom bashrc

export PATH="~/.local/bin:~/.cargo/bin:/home/coyote2/bin:$PATH"

# run "ln -s ~/etc/bashrc ~/.bashrc" for normal use
# LATER: this file is located at ~/etc/bashrc
# LATER: this file is located at ~/etc/bashrc
# local might be better?
export EDITOR=nvim
set -o vi
xmodmap ~/.Xmodmap
#alias sudo=doas
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'
alias v='nvim ~/git/README.md'
alias lla='exa -al'
alias la='exa -a'
alias ls='exa'
alias l='exa'
alias lr='exa -R'
alias ll='exa -l --sort newest'
alias l.='la -d .?*'
alias s='du -sh * | sort -h'
alias h='clear;neofetch;exa'


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## ## alias vwgit='git --git-dir=$HOME/vimwiki-git-repo/ --work-tree=$HOME'
## ## 
## ## # Create a git repository for business-class
## ## # execute "git init --bare $HOME/business-class.git
## ## # and then "gbc config --local status.showUntrackedFiles no"
## ## # New Alias to add files to business-class:
## ## alias gbc='git --git-dir=$HOME/business-class.git/ --work-tree=$HOME'
## ## # Useage example: dotfiles 
## ## #  gbc add /path/to/file
## ## #  gbc commit -m "A short message"
## ## #  gbc push
## ## 
## ## 
## ## # Create a git repository for personal-class
## ## # execute "git init --bare $HOME/personal-class.git"
## ## # and then "gpc config --local status.showUntrackedFiles no"
## ## # New Alias to add files to personal-class:
## ## alias gpc='git --git-dir=$HOME/personal-class.git/ --work-tree=$HOME'
## ## # Useage example: dotfiles 
## ## #  gpc add /path/to/file
## ## #  gpc commit -m "A short message"
## ## #  gpc push
## ## 
## ## 
## ## ## THIS IS OLD, UNUSED, Clean up and Delete?!
## ## # execute "git init --bare $HOME/.dotgit
## ## # Create an alias for adding files
## ## alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
## ## # To configure, execute:
## ## #  dotgit config --local status.showUntrackedFiles no
## ## # Useage example: dotfiles 
## ## #  dotgit add /path/to/file
## ## #  dotgit commit -m "A short message"
## ## #  dotgit push
## ## 

## DEALING WITH HISTORY

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# I think I want to change this, no duplicates, but include space, 
# I don't need a "stealth" mode with the space, I just screw up stuff.

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
# These values are 10x higher than default.


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## # # set variable identifying the chroot you work in (used in the prompt below)
## # if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
## #     debian_chroot=$(cat /etc/debian_chroot)
## # fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# # # uncomment for a colored prompt, if the terminal has the capability; turned
# # # off by default to not distract the user: the focus in a terminal window
# # # should be on the output of commands, not on the prompt
# # force_color_prompt=yes
# # 
# # if [ -n "$force_color_prompt" ]; then
# #     if [ -x tput ] && tput setaf 1 >&/dev/null; then
# # 	# We have color support; assume it's compliant with Ecma-48
# # 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# # 	# a case would tend to support setf rather than setaf.)
# # 	color_prompt=yes
# #     else
# # 	color_prompt=
# #     fi
# # fi
# # 
# # ## # if [ "$color_prompt" = yes ]; then
# # ## #     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# # ## # else
# # ## #     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# # ## # fi
# # 
# # unset color_prompt force_color_prompt
# # 
# # # If this is an xterm set the title to user@host:dir
# # case "$TERM" in
# # xterm*|rxvt*)
# #     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
# #     ;;
# # *)
# #     ;;
# # esac

# My Simple Prompt.
export PS1="\[\e[34m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\\$ "

# enable color support of ls and also add handy aliases
if [ -x dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
    alias ls='exa'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Robert W. Current's personal ls shortcuts:


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## All this shit needs to get out,
## It's just stupid prompt shit.
## 
## # Powerline configuration
## if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
##   powerline-daemon -q
##   POWERLINE_BASH_CONTINUATION=1
##   POWERLINE_BASH_SELECT=1
##   source /usr/share/powerline/bindings/bash/powerline.sh
## fi
## eval "$(starship init bash)"
## 
## ## # Define Current Law as Business Class
## ## alias cl='cd ~/open-matters/;vim -c NERDTree ~/src/business/matters/ReadMe.md;cd ~/;clear;neofetch;l'
## ## # Start My "Business Class" flight
## ## #cl
## ## # Define Current Law as Business Class
## ## #alias cl='cd ~/src/business/matters/;vim -c NERDTree ~/src/business/matters/ReadMe.md;cd ~/;clear;neofetch;l'
## ## 
## ## 
## ## # Define Journal Reader as Personal Class
## ## alias jr='cd ~/src/personal/;vim -c NERDTree ~/src/personal/ReadMe.md;cd ~/;clear;neofetch;l'
## ## # Start My "Journal Reader" mode.
## ## #jr
## ## 
## ## jthelp.sh


# This is broken, don't know what it was suppose to do
# if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END


# if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then source /usr/share/powerline/bindings/bash/powerline.sh fi

# if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#   powerline-daemon -q
#   POWERLINE_BASH_CONTINUATION=1
#   POWERLINE_BASH_SELECT=1
#   source /usr/share/powerline/bindings/bash/powerline.sh
# fi

eval "$(oh-my-posh init bash)"

