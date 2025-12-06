export ME_XORG_SESSION_LOG=$ME_XORG_LOG_DIR/xsession.$DISPLAY.log
rm -f $ME_XORG_SESSION_LOG
touch $ME_XORG_SESSION_LOG

xlog "starting session"

xrandr -s 1920x1200
setxkbmap -option ctrl:swapcaps

devname='Logitech G203 LIGHTSYNC Gaming Mouse'
devid=$(xinput list --id-only "$devname" 2>/dev/null)
if [[ -n "$devid" ]]; then
    propid=282
    on=1
    xlog "setting natural scroll for $devname"
    xinput set-prop $devid $propid $on
fi

exec dbus-launch --exit-with-session i3

# vim: ft=sh et sw=4 sts=4
