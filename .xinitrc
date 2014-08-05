if which vmware-user-suid-wrapper > /dev/null 2>&1 ; then
    vmware-user-suid-wrapper
fi

if [[ $(uname) == Darwin ]] ; then
  /bin/sh /usr/X11/lib/X11/xinit/xinitrc
else
  xrdb ~/.Xresources
  xterm &
  if which startfluxbox > /dev/null 2>&1 ; then
    exec startfluxbox
  else
    exec twm
  fi
fi

# vim: ft=sh
