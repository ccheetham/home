# PowerShell
Set-PSREadLineOption -HistorySavePath $env:XDG_CACHE_HOME/powershell/history

# Vim
Set-Alias vi vim

# Git
Set-Alias g git
function gg {
    g status $args
}
Import-Module $Env:ME_REPO_DIR'\posh-git\src\posh-git.psd1'

# DotNet
Set-Alias dn dotnet

# Docker
Set-Alias d docker
function drun {
    d run -it --rm $args
}

# Gradle
function gr {
    & .\gradlew.bat $Args
}

# use native exes
rm alias:curl
rm alias:wget

. $Env:Xdg_Config_Home\profile.d\90steeltoe.ps1
. $Env:Xdg_Config_Home\profile.d\90tcserver.ps1
