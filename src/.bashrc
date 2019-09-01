# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Use vim-like key bindings to navigate the command line
set -o vi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


#######################
### Control History ###
#######################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# HISTSIZE is the number of lines or commands that are stored in memory
# HISTFILESIZE is the number of lines or commands that are allowed in the history file
# HISTTIMEFORMAT set the date format when using `history`
HISTSIZE=99999999
HISTFILESIZE=9999999999
HISTTIMEFORMAT="%m/%d/%y %T >> "


############################
### Prompt Configuration ###
############################

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

# provides optional variables for use in the prompt
if [ -d ~/.bash/git-aware-prompt ]; then
    export GITAWAREPROMPT=~/.bash/git-aware-prompt
    source "${GITAWAREPROMPT}/main.sh"
    unset GITAWAREPROMPT
else
    git_branch=
    git_dirty=
fi

if [ "$color_prompt" = yes ]; then
    txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
    txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
    txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"       # Text Reset
    txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White
    txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow

    PS1="\n\n\[$txtblu\]\h\[$txtrst\] \[$txtylw\]\w\[$txtrst\] \[$txtblu\]\$git_branch\]\[$txtred\]\$git_dirty\[$txtrst\]\n\[$txtwht\]\A ▶\[$txtrst\] "
    unset txtblu txtred txtrst txtwht txtylw git_branch git_dirty
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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

# Add ASDF command and bash completion features
if [ -f ~/.asdf/asdf.sh ]; then
    . ~/.asdf/asdf.sh
    . ~/.asdf/completions/asdf.bash
fi

############################
### Brew Bash Completion ###
############################

HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
