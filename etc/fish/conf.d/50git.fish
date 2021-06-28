alias g='git'
alias gh='g help'
alias gg='g status'
alias gtidy='g commit -mtidy'
alias gtypo='g commit -mtypo'
alias grefactor='g commit -mrefactor'
alias gcrumbs='g commit -mbreadcrumbs'
alias gvestige='g commit -m"remove vestige"'

function ghc
    set repo $argv[1]
    g clone git@github.com:$repo
end
