export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if [[ $TERM == (*256*|xterm) ]]; then
    export TERM="xterm-256color"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh

ZSH_THEME="crusador"

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTORENAME=true

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh plugins
plugins=(
    common-aliases
    git
    python pip django
    extract
    command-not-found
    repo
    tmux
    lol
    rsync
    colorize
    colored-man
    vundle
    expand-dots-to-parent-dirs
    rooter
)

source $ZSH/oh-my-zsh.sh


if [ -f ~/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if [ -f ~/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi
