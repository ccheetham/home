HISTFILE=~/.zhistfile
HISTSIZE=1000
SAVEHIST=1000

setopt no_beep notify
setopt auto_cd auto_pushd pushd_ignore_dups pushd_silent pushd_to_home
setopt append_history extended_history share_history hist_ignore_all_dups
setopt promptsubst

# delete paths one node at a time
export WORDCHARS=''

autoload -Uz compinit
compinit -d $HOME/.zcompdump-$(hostname)

autoload -U promptinit
promptinit

source ~/.me/profile

# vim: ft=zsh
