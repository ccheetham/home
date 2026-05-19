alias tcd='cd $TCS_QA'
alias dtcs='d images gopivotal-tcs-docker-local.jfrog.io/tc-server-qa'

function tcskill
    set pids (jps -l | grep org.apache.catalina.startup.Bootstrap | awk '{print $1}')
    if [ -z "$pids" ]
        msg "no running tcRuntime instances detected"
        return
    end
    for pid in $pids
        echo killing $pid
        kill $pid
    end
end

function tmtcs
    if ! tmux a -t tcsqa
        tcd
        tmux new -s tcsqa
    end
end

function tcs
    set cmd $TCS_QA/target/distro/*/tcserver
    if [ (count $cmd) -eq 0 ]
        err tc Server QA target 4.x not installed
        return 1
    end
    echo "% "(basename $cmd)" $argv"
    $cmd $argv
end

function tci
  _tc3xrun tcruntime-instance.sh $argv
end

function tca
  _tc3xrun tcruntime-admin.sh $argv
end

function tcc
  _tc3xrun tcruntime-ctl.sh $argv
end

function _tcrun
    set cmd $argv[1]
    set -e argv[1]
    if [ $ME_OS = cygwin ]
        set cmd $cmd.bat
    end
    echo % (basename $cmd) $argv
    $cmd $argv
end

function _tc3xrun
    set cmd $TCS_QA/target/distro/$argv[1]
    set -e argv[1]
    if [ ! -f $cmd ]
        err tc Server QA target 3.x not installed
        return 1
    end
    _tcrun $cmd $argv
end
