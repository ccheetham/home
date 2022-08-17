$ProfileDir = "$PSScriptRoot\..\..\etc\profile.d"

# use native exes
foreach ($alias in "curl", "wget")
{
    if (Test-Path alias:$alias)
    {
        Remove-Alias $alias
    }
}


foreach($file in Get-ChildItem "$ProfileDir" -Filter *.ps1)
{
    "sourcing $($file.Name)"
    . $file.FullName
}
