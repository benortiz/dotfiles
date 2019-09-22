# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# Reset vars to handle multiple source-ings in a session
PATH="/bin:/usr/bin:/usr/sbin"
MANPATH=""
INFOPATH=""

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add asdf to the path
if [ -d "$HOME/.asdf" ] ; then
    PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
fi

# Add linuxbrew to the path
HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
if [ -d "$HOMEBREW_PREFIX" ] ; then
    HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew"
    HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
    PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
    MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH"
    INFOPATH="$HOMEBREW_PREFIX/share/info:$INFOPATH"
else
    unset HOMEBREW_PREFIX
fi

# Add GPG key to bash profile
export GPG_TTY=$(tty)
# Set default editors
export EDITOR=vim
export GIT_EDITOR=vim
# Set janky clipboard path
export CT_CLIPBOARD=/tmp/clipboard
# Opens the link on my local machine
export BROWSER=local-open
