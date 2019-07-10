source ~/etc/profile
autoload -U promptinit;     promptinit
autoload -Uz compinit;      compinit -u -d $ME_ZSH_CACHE_DIR/compdump.$ME_HOST
autoload colors;            colors
for z in $ME_ZSH_CONFIG_DIR/* ; do
    source $z
done
for usrdir in /usr/local /usr; do
  for agdir in antigen zsh-antigen; do
    if [ -f $usrdir/share/$agdir/antigen.zsh ]; then
      if [ ! -d ~/.antigen ]; then
        mkdir ~/.antigen
        touch ~/.antigen/debug.log
      fi
      source $usrdir/share/$agdir/antigen.zsh
      antigen use oh-my-zsh
      antigen theme robbyrussell
      antigen bundle zsh-users/zsh-syntax-highlighting
      antigen apply
      break 2
    fi
  done
done
