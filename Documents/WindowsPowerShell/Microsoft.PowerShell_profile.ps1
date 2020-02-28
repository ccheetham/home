Import-Module $Env:ME_REPO_DIR'\posh-git\src\posh-git.psd1'

Set-Alias vi vim

Set-Alias g git
Function gg { g status }

Set-Alias d docker
