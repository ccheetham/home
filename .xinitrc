export ME_XORG_SESSION_LOG=$ME_XORG_LOG_DIR/xsession.$DISPLAY.log

rm -f $ME_XORG_SESSION_LOG
touch $ME_XORG_SESSION_LOG

xlog "starting session"

xrandr -s $ME_XORG_RESOLUTION
setxkbmap -option ctrl:swapcaps

enable_natural_scroll() {
    local devname=$(echo $1 | cut -d: -f1)
    local propid=$(echo $1 | cut -d: -f2)
    local devid=$(xinput list --id-only "$devname" 2>/dev/null)
    if [[ -n "$devid" ]]; then
        xlog "enabling natural scroll for $devname ($propid)"
        xinput set-prop $devid $propid 1
    fi
}

enable_natural_scroll "$ME_XORG_MICE"

exec dbus-launch --exit-with-session i3

# vim: ft=sh et sw=4 sts=4
