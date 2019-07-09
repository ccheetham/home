source ~/etc/profile
for usrdir in /usr /usr/local; do
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
    fi
  done
done
