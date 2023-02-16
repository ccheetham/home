$env:SCOOP = "${Env:USERPROFILE}\local\scoop"
$env:SCOOP_CACHE = "${Env:USERPROFILE}\var\scoop"

if (!(Get-Command "scoop")) {
    $installScoop = "install_scoop.ps1"
    Invoke-RestMethod get.scoop.sh > $installScoop
    $cmd = ".\$installScoop"
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $isAdmin = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    if ($isAdmin) {
        $cmd += " -RunAsAdmin"
    }
    Invoke-Expression $cmd
    Remove-Item $installScoop
}

scoop bucket add extras
scoop install curl
scoop install git
scoop install neovim
scoop install pwsh
scoop install python
pip install neovim
pip install pipenv
pipenv install
reg import "$env:SCOOP\apps\python\current\install-pep-514.reg"
reg import "$env:SCOOP\apps\pwsh\current\install-explorer-context.reg"
reg import "$env:SCOOP\apps\pwsh\current\install-file-context.reg"
scoop install vscode
reg import "$env:SCOOP\apps\vscode\current\install-context.reg"
reg import "$env:SCOOP\apps\vscode\current\install-associations.reg"
scoop install wget
scoop install windows-terminal
reg import "$env:SCOOP\apps\windows-terminal\current\install-context.reg"

git clone git@github.com:ccheetham/home
Move-Item home\.git .git
Remove-Item home -Recurse
git checkout .
. .\etc\powershell\Microsoft.PowerShell_profile.ps1
python -m me.repo refresh
$profileDir = Split-Path -Path "$profile"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents\PowerShell" -Target "$env:ME_CONFIG_DIR\powershell"
