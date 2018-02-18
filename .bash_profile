case $(uname) in
    CYGWIN*|MING*)
        zsh=$(type zsh 2>/dev/null | awk '{print $NF}')
        if [[ -n $zsh ]]
        then
            SHELL=$zsh exec zsh -l
        else
            source ~/.bashrc
        fi
        ;;
esac
