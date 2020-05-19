# PowerShell
Set-PSREadLineOption -HistorySavePath $env:XDG_CACHE_HOME/powershell/history

# Vim
if ([System.Environment]::OSVersion.Platform -Like 'Win*') {
    Set-Alias vi gvim
}
else {
    Set-Alias vi vim
}

# Git
Set-Alias g git
function gg {
    g status $args
}
Import-Module $Env:ME_REPO_DIR'\posh-git\src\posh-git.psd1'

# Docker
Set-Alias d docker
function drun {
    d run -it --rm $args
}

# Gradle
function gr {
    & .\gradlew.bat $Args
}

# tc Server
function tcd {
    cd $Env:USERPROFILE\src\appsuite\tcs-tc-server-qa
}
