# =============================================================================
# PowerShell profile
# ------------------------------------------------------------------------------
# to use on windows (may need Developer mode enabled or run as Administrator):
#   PS > cmd /c mklink $profile $home\etc\powershell\Microsoft.PowerShell_profile.ps1
# =============================================================================

# PowerShell settings
if (!($IsWindows)) {
    Set-PSReadLineOption -HistorySavePath $env:XDG_CACHE_HOME/powershell/History
}

# Vim
if ($IsWindows) {
    set-alias vi gvim
}

# Git
set-alias   g       git
function    gg      { & g status $args }

# Docker
set-alias   d       docker
function    drun    { d run -it --rm $args }

# vim: ft=ps1
