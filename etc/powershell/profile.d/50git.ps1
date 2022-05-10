Set-Alias g git

function gg { g status $args }

Import-Module "${Env:ME_REPO_DIR}/posh-git/src/posh-git.psd1"
