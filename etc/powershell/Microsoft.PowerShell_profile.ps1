if (Test-Path env:HOME) {
    $profileDir = "$env:HOME\etc\profile.d"
} else {
    $profileDir = "$env:USERPROFILE\etc\profile.d"
}


foreach($file in Get-ChildItem "$profileDir" -Filter "*.ps1") {
    "sourcing $($file.Name)"
    . $file.FullName
}
