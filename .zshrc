# Path to your oh-my-zsh configuration.
export TERM="xterm-256color"
[ $SCREEN ] && export TERM="screen-256color"

if [ ! $SCREEN ]; then
    screen
fi

ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract django command-not-found repo screen lol rsync colorize)

source $ZSH/oh-my-zsh.sh

alias ls='ls -1 --color=auto'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias shutdown='sudo shutdown'
alias bandkar='xset dpms force off'
alias sl='ls -l --color=auto'
alias ll='ls -hlt --color=auto'
alias la='ls -ahlt --color=auto'
alias pdflatex='pdflatex --interaction batchmode'
alias vim='vim -p '
alias vimo='vim -O '
alias more='less'
alias wget='wget -c '
alias screens='screen -ls'
alias screenS='screen -S'
alias echo='echo -e '
alias clipboard='xclip -selection "clipboard" -o'
alias ..='cd ..'
alias ...='cd ../..'
alias ....=' cd ../../..'
alias xc='xclip -selection clipboard -i '
alias ports='netstat -tlnp | column -t '
alias xo='xdg-open '
alias df='df -h '
alias py='python '
alias repoUpdate='repo checkout stage && repo forall -c "git remote update && git pull origin stage"'
alias gut='git'
alias cd..='cd ..'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
