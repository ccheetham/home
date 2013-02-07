if [[ $(uname -s) == Darwin ]]; then
  /bin/sh /usr/X11/lib/X11/xinit/xinitrc
else
  xrdb ~/.Xresources
  xterm &
  twm
fi

# vim: ft=sh
