# =============================================================================
# PowerShell profile
# =============================================================================

# PowerShell settings
if ([System.Environment]::OSVersion.Platform -Eq 'Unix') {
    Set-PSReadLineOption -HistorySavePath $env:XDG_CACHE_HOME/powershell/History
}

# Vim

if ([System.Environment]::OSVersion.Platform -Like 'Win*') {
    set-alias vi gvim
}

# Git
set-alias g  git
function gg { g status $args }

# Docker
set-alias d docker
function drun { d run -it --rm $args }

# vim: ft=ps1
