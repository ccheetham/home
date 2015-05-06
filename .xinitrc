checkexe() {
    local exe=$1
    which $exe > /dev/null 2>&1 && return 0 || return 1
}

if checkexe vmware-user-suid-wrapper ; then
    vmware-user-suid-wrapper
fi


if [[ $ME_OS == osx ]] ; then
    exec /bin/sh /usr/X11/lib/X11/xinit/xinitrc
else
    xrdb ~/.Xresources
    xterm &
    if checkexe i3 ; then
        exec i3
    elif checkexe startfluxbox ; then
        exec startfluxbox
    else
        exec twm
    fi
fi

# vim: ft=sh
