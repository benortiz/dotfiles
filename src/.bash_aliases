# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

cat() {
    bat "$@";
}

# Ruby dev
alias be='bundle exec'

# git alias'
alias g='git status'
alias gap='git add -p'
alias gb='git branch'
alias gc-='git checkout -'
alias gcm='git checkout master'
alias gd='git diff'
alias gl='git log'
alias grim='git rebase -i master'
alias gwip='git add . && git commit -m "wip"'

# MacOS
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

# Dotfiles
alias sb='source $HOME/.bash_profile'
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias tmuxconf="vim ~/.tmux.conf"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Send to clipper clipboard
# https://github.com/wincent/clipper
alias clip="nc -N localhost 8377"
