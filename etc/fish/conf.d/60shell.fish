alias h='history'

alias p='pushd'
alias pp='popd'

set -e ls_opts
set ls_cmd ls
switch $ME_OS
    case 'bsd' 'osx'
        set ls_opts " -FGH"
    case '*'
        for opt in classify color group-directories-first
            if $ls_cmd --$opt > /dev/null 2>&1
                set -a ls_opts " --$opt"
            end
        end
end
alias ls="$ls_cmd$ls_opts"
set -e ls_cmd
set -e ls_opts

alias ll='ls -lh'
alias l1='ls -1'
alias lF='ls *(.)'
alias lD='ls -d *(/)'
alias la='ls -A'
if ls -@ > /dev/null 2>&1
    alias l@='ll -@'
end

alias mkdir='mkdir -p'
alias md='mkdir'

alias cls='clear'

function scratch
    set scratch_dir $HOME/scratch
    if ! mkdir -p $scratch_dir
        return 1
    end
    cd $scratch_dir
    # ensure cd worked
    if [ (pwd) != "$scratch_dir" ]
        err "hmm, expected to be in:"
        echo "      $scratch_dir"
        err "but actual dir is:"
        echo "      "(pwd)
        err "... something is amiss"
        return 1
    end

    # ensure dir writeable
    if ! touch .scratched
        err "scratch directory not writeable"
        return 1
    end
    set files * .*
    if [ (count $files) -gt 0 ]
        rm -rf $files
    end
end
