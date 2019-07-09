if [ ! -d ~/.antigen ]; then
  mkdir ~/.antigen
  touch ~/.antigen/debug.log
fi
source ~/etc/profile
source /usr/share/zsh-antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
