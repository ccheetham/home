checkexe() {
    local exe=$1
    which $exe > /dev/null 2>&1 && return 0 || return 1
}

if checkexe vmware-user-suid-wrapper ; then
    vmware-user-suid-wrapper
fi

PATH=/usr/local/bin:$PATH
xrdb ~/.Xresources
xset r rate 250 30
if checkexe i3 ; then
    exec i3
elif checkexe startfluxbox ; then
    exec startfluxbox
else
    exec twm
fi

# vim: ft=sh
