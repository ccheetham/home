# PowerShell
Set-PSREadLineOption -HistorySavePath "${Env:XDG_CACHE_HOME}/powershell/history"

# Docker
Set-Alias d docker
function drun { d run -it --rm $args }

# Gradle
function gr { & ./gradlew $Args }

# use native exes
foreach ($alias in "curl", "wget")
{
    if (Test-Path alias:$alias)
    {
        Remove-Alias $alias
    }
}

foreach($file in Get-ChildItem "${Env:XDG_CONFIG_HOME}/powershell/profile.d/" -Filter *.ps1)
{
    . $file.FullName
}
