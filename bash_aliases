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
alias v=vim
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
alias xo='exo-open '
alias df='df -h '
alias py='python '
alias repoClean='repo forall -c "git clean -dfx" -p'
alias gut='git'
alias cd..='cd ..'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias rm=\rm
alias gs='g s'
alias gl='g l'
alias grep='grep --color=auto'
alias _='sudo'
alias pyc='pyclean .'
alias tl='tmux list-sessions'
alias ta='tmux attach-session -t'

alias txc='latexmk -c'
alias txpdf='latexmk -quiet -f -pdf'
alias txpvc='latexmk -pvc'

alias ejectdrive='sudo udisksctl power-off --block-device'

function define() {
    wn $1 -over
}

function ghclone() {
    git clone "https://github.com/$1"
}
