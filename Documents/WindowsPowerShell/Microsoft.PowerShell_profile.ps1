Import-Module $Env:ME_REPO_DIR'\posh-git\src\posh-git.psd1'

Set-Alias vi vim

Set-Alias g git
Function gg { g status $args }

Set-Alias d docker

Function gr {
     & .\gradlew.bat $Args
}

Function tcd { cd $Env:USERPROFILE\src\appsuite\tcs-tc-server-qa }
