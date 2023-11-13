if (Test-Path env:HOME) {
    $profileDir = "$env:HOME\etc\profile.d"
} else {
    $profileDir = "$env:USERPROFILE\etc\profile.d"
}


"Sourcing profile directory $profileDir"

if (Test-Path "$profileDir\local.pre.ps1") {
    # "Sourcing $profileDir\local.pre.ps1"
    . "$profileDir\local.pre.ps1"
}

foreach ($file in Get-ChildItem "$profileDir" | Where-Object {$_ -Match '\d\d.*.ps1'}) {
    # "Sourcing $file"
    . $file.FullName
}

if (Test-Path "$profileDir\local.post.ps1") {
    # "Sourcing $profileDir\local.post.ps1"
    . "$profileDir\local.post.ps1"
}
