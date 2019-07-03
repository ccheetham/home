#!/usr/bin/env pwsh

$BaseDir = "$PSScriptRoot\.."
$VimrcLink = "$BaseDir\_vimrc"
$VimRuntimeLink = "$BaseDir\vimfiles"

if (Test-Path -Path $VimrcLink) {
    Remove-Item -Path $VimrcLink -Force
}
cmd /c mklink $VimrcLink .vimrc

if (Test-Path -Path $VimRuntimeLink) {
    Remove-Item -Path $VimRuntimeLink -Force
}
cmd /c mklink /d $VimRuntimeLink .vim
