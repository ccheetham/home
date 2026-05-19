function me
    env | grep '^ME' | LC_ALL=C sort
end

function reenv
    source $XDG_CONFIG_HOME/fish/conf.d/*
    source $XDG_CONFIG_HOME/fish/config.fish
end
