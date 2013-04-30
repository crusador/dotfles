# if [ -f /etc/bash_completion ]; then
#   . /etc/bash_completion
# fi
PS1="\[\033]0;\W \007\]${debian_chroot:+($debian_chroot)}\\[\033[01;32m\]\[\033[01;34m\]\w \$ \[\033[00m\]" 

setTitle()      # Adds some text in the terminal frame.
{
   case "$TERM" in
   *term | rxvt)
   echo -n -e "\033]0;$*\007" ;;
   *)  ;;
   esac
}

extract()      # Handy Extract Program.
{
   if [ -f $1 ] ; then
      case $1 in
	 *.tar.bz2)   tar xvjf $1     ;;
	 *.tar.gz)    tar xvzf $1     ;;
	 *.bz2)       bunzip2 $1 ;;
	 *.rar) unrar x $1 ;;
	 *.gz) gunzip $1 ;;
	 *.tar) tar xvf $1 ;;
	 *.tbz2) tar xvjf $1 ;;
	 *.tgz) tar xvzf $1 ;;
	 *.zip) unzip $1 ;;
	 *.Z) uncompress $1 ;;
	 *.7z) 7z x $1 ;;
	 *) echo "'$1' cannot be extracted via >extract<" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

# Browser specific functions to open in backgroud
gc() {
	command google-chrome "$@" 1>/dev/null 2>/dev/null &
}
google-chrome() {
	gc "$@"
}
googlechrome() {
	gc "$@"
}
gci() {
	gc "--incognito" "$@"
}

ff() { command firefox "$@" 1>/dev/null 2>/dev/null & }
firefox() {
	ff "$@"
}
ffi() {
	ff "-private" "$@"
}


_boom_complete() {
    local cur prev lists curr_list items
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    curr_list=`eval echo "$prev"`
    local IFS=$'\n'

    if [ $COMP_CWORD -eq 1 ]; then
        lists=`boom | sed 's/^  \(.*\) ([0-9]\+)$/\1/'`
        COMPREPLY=( $( compgen -W '${lists}' -- ${cur} ) )
    elif [ $COMP_CWORD -eq 2 ]; then
        items=`boom $curr_list | sed 's/^    \(.\{0,16\}\):.*$/\1/'`
        COMPREPLY=( $( compgen -W '${items}' -- ${cur} ) )
    fi
}
complete -o filenames -F _boom_complete boom



alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias shutdown='sudo shutdown'
alias bandkar='xset dpms force off'
alias ls='ls -1 --color=auto'
alias ll='ls -hlrt --color=auto'
alias la='ls -ahlrt --color=auto'
alias pdflatex='pdflatex --interaction batchmode'
alias vim='setTitle Vim $PWD ; vim -p '
alias vimo='setTitle Vim $PWD ; vim -O '
alias more='less'
alias wget='wget -c '
alias echo='echo -e '
alias clipboard='xclip -selection "clipboard" -o'
alias ..='cd ..'
alias ...='cd ../..'
alias ....=' cd ../../..'
alias xc='xclip -selection clipboard -i '

# Typo aliases
alias gut='git'
alias cd..='cd ..'

# These are now declared in ~/.profile
# export CLASSPATH='.:/home/jitesh/.classes/mysql-connector-java-5.0.7-bin.jar'
# export EDITOR='/usr/bin/vim'
# export CLASSPATH='.:/home/jitesh/.classes/*'
# export WWW='/var/www/'
# export PATH="/usr/local/texlive/bin/x86_64-linux:$PATH"

# /usr/games/fortune -s | cowsay
