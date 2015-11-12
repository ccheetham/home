if [ -n "$BASH_VERSION" ]; then
    echo "hmm, this feels like bash"
    if [ -f $HOME/.bashrc ] ; then
        source $HOME/.bashrc
    fi
else
    echo "hmm, this doesn't feel like zsh"
fi
