#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### AUTOCOMPLETION ###

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

### COLORS ###

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

### TERMINAL PROMPT ###

#PS1='[\u@\h \W]\$ '

#case ${TERM} in
#  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
#    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
#
#    ;;
#  screen*)
#    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
#    ;;
#esac

export COLOR_USER=${COLOR_GREEN}
if [ `id -u` -eq 0 ]; then
  export COLOR_USER=${COLOR_RED}
fi

export PS1="\[${COLOR_LIGHT_CYAN}\]\D{%a %d-%m}\[${COLOR_NC}\] (\[${COLOR_USER}\]\u@\h\[${COLOR_NC}\]) : \[${COLOR_WHITE}\]\w\[${COLOR_NC}\] "
export PS2='> '
export PS3='#? '
export PS4='+ '

### ALIASES ###

alias vi=vim
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export CLICOLOR='1'
alias ls='ls --color'
export LSCOLORS="gxDxFxdxCxExExhbadgxgx"

### BASH HISTORY ###

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'
shopt -s histappend  
PROMPT_COMMAND='history -a' 

# Number of lines to keep in the history file
export HISTSIZE=1000000
# bash history is timestamped as YYYY-MM-DD HH:MM:SS
export HISTTIMEFORMAT='%F %T '
# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

##############################

# After each command, update LINES and COLUMNS to reflect the current window size
[[ $DISPLAY ]] && shopt -s checkwinsize
