alias ho='hostname -f'
alias hosts='sudo $EDITOR /etc/hosts'
if [ $ME_OS = osx ]
   alias dmesg='sudo dmesg'
end

function toor
    DISPLAY= sudo su -
end

function joe
    sudo su - joe
end

function reboot
    sudo /sbin/reboot
end

function poweroff
    switch $ME_OS
        case 'osx'
            sudo /sbin/halt
        case 'solaris'
            sudo /usr/sbin/poweroff
        case '*'
            sudo /sbin/poweroff
    end
end

function systail
    for syslog in /var/log/syslog /var/log/messages /var/log/system.log
        if [ -f "$syslog" ]
            tail -f "$syslog"
            return
        end
    end
    echo "do not know how to tail system log on this plaform/host" >&2
    return 1
end

# -----------------------------------------------------------------------------
# service management
# -----------------------------------------------------------------------------

if [ $ME_OS = osx ]
    alias melaunch='launchctl list | grep "\sme\."'
end

if [ $ME_OS = linux ]
    alias chkconfig='sudo chkconfig'
end

if [ $ME_OS = solaris ]
    alias svcadm='sudo svcadm'
end

# -----------------------------------------------------------------------------
# storage management
# -----------------------------------------------------------------------------

function space
    echo "Mount (Volume)            Size   Used  Avail   Pct   Filesystem"
    echo "-----------------------  -----  -----  -----  ----   ----------------"
    set format "%-23s  %5s  %5s  %5s  %4s   %s"
    if [ $ME_OS = osx ]
        for fs in /Volumes/*
            df -Hl "$fs" | tail -1 | \
               awk '{printf "'$format'\n", $9, $2, $3, $4, $5, $1}'
        end
    end
end

# -----------------------------------------------------------------------------
# process management
# -----------------------------------------------------------------------------

if [ $ME_OS = osx ]
    alias top='top -o cpu'
end

alias htop='sudo htop --sort-key PERCENT_CPU'

# -----------------------------------------------------------------------------
# package management
# -----------------------------------------------------------------------------

if [ (id -u) -ne 0 ]
    switch $ME_OS
        case 'bsd'
            alias pkg='sudo pkg'
            alias pcup='sudo pc-updatemanager'
        case 'linux'
            switch $ME_DISTRO_FLAVOR
                case 'centos' 'redhat'
                    alias yum='sudo yum'
                    alias systemctl='sudo systemctl'
                case 'debian' 'ubuntu' 'neon'
                    alias tude='sudo aptitude'
                    alias apt='sudo apt'
                    alias apt-get='sudo apt-get'
                    alias apt-key='sudo apt-key'
                case 'fedora'
                    alias dnf='sudo dnf'
                case 'gentoo'
                    alias e='sudo -E emerge --verbose'
                    alias eup='e -auDNv @world --with-bdeps=y'
                    alias eclean='e -a --depclean'
                    alias elog='sudo view /var/log/portage/elog/summary.log'
                case 'suse'
                    alias zyp='sudo zypper'
            end
        case 'solaris'
            alias pkg='sudo pkg'
            alias pkgutil='sudo /opt/csw/bin/pkgutil'
    end
end

# -----------------------------------------------------------------------------
# kernel management
# -----------------------------------------------------------------------------

function purge_kernel
    if [ (count $argv) -ne 1 ]
        err usage: $_ version
        return 1
    end
    set version $argv[1]
    sudo dpkg --purge linux-image-$version linux-image-extra-$version
    sudo dpkg --configure --pending
end
