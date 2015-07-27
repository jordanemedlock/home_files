# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

short_prompt='\[\033[01;34m\]bash\[\033[00m\]$ '
long_prompt='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ "$color_prompt" = yes ]; then
    PS1="$short_prompt"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -G'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ls='ls -G'

# some more ls aliases
alias ll='ls -alFG'
alias la='ls -laG'
alias l='ls -CFG'

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

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias emacs="emacs -nw"
alias fucking='sudo'

alias untar='tar -xvf'

alias school="cd ~/School/15/"

# Parenting changing perms on / #
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
 fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export PATH=/Users/jem2/Library/Haskell/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/jem2/Library/Haskell/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/mine:/usr/mine:/usr/mine/scala/bin:/usr/local/mysql/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=/usr/texbin:$PATH
export PATH=~/bin:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig
export EDITOR="/usr/bin/vim"
export CIL=/Users/jem/School/15/independent_study/genprog-source-v3.0/cil-1.3.7
export USE_PELLACINI=true

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# shopt -s globstar

# OPAM configuration
. /Users/jem/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export PATH=$PATH:/Users/jem/.opam/system/bin:/Users/jem/bin:/usr/texbin:/Users/jem/.cabal/bin:/Users/jem/Library/Haskell/bin:/Users/jem2/Library/Haskell/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/jem2/Library/Haskell/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/mine:/usr/mine:/usr/mine/scala/bin:/usr/local/mysql/bin:/Users/jem/.rvm/bin:/Development/adt-bundle/sdk/platform-tools:/Development/adt-bundle/sdk/tools
export PATH=$PATH:/usr/local/lib/node_modules

export PATH=$PATH:"/Applications/Racket v6.1.1/bin"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="/usr/local/sbin:$PATH"

export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export PATH=$PATH:.cabal-sandbox/bin
export PATH=$PATH:/Users/jem/.stack/programs/x86_64-osx/ghc-7.10.1/bin
export PATH=.:$PATH
