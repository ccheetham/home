if (Test-Path env:HOME) {
    $profileDir = "$env:HOME\etc\profile.d"
} else {
    $profileDir = "$env:USERPROFILE\etc\profile.d"
}


"sourcing $($profileDir)"
foreach($file in Get-ChildItem "$profileDir" -Filter "*.ps1") {
    . $file.FullName
}
