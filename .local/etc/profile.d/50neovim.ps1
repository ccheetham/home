if (Get-command "nvim" -ErrorAction SilentlyContinue)
{
  $Env:EDITOR = "nvim"
  Set-Alias vi $Env:EDITOR
}
