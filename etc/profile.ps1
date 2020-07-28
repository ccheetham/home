# PowerShell
Set-PSREadLineOption -HistorySavePath $env:XDG_CACHE_HOME/powershell/history

# Vim
Set-Alias vi nvim

# Git
Set-Alias g git
function gg {
    g status $args
}
Import-Module $Env:ME_REPO_DIR'\posh-git\src\posh-git.psd1'
Import-Module $Env:ME_REPO_DIR'\oh-my-posh\oh-my-posh.psd1'
Set-Theme Avit

# Docker
Set-Alias d docker
function drun {
    d run -it --rm $args
}

# Gradle
function gr {
    & .\gradlew.bat $Args
}

. $Env:Xdg_Config_Home\profile.d\90steeltoe.ps1
. $Env:Xdg_Config_Home\profile.d\90tcserver.ps1
