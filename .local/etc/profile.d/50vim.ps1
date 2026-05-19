if (!(Get-command "nvim" -ErrorAction SilentlyContinue))
{
  if (Get-command "vim" -ErrorAction SilentlyContinue)
  {
    $Env:EDITOR = "vim"
    Set-Alias vi $Env:EDITOR
  }
}
