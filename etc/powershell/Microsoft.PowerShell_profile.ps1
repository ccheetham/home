# PowerShell
Set-PSREadLineOption -HistorySavePath "${Env:XDG_CACHE_HOME}/powershell/history"

# use native exes
foreach ($alias in "curl", "wget")
{
    if (Test-Path alias:$alias)
    {
        Remove-Alias $alias
    }
}

foreach($file in Get-ChildItem "${Env:XDG_CONFIG_HOME}/profile.d/" -Filter *.ps1)
{
    . $file.FullName
}
