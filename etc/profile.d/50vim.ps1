if (!(Get-command "nvim" -ErrorAction SilentlyContinue))
{
  if (Get-command "vim" -ErrorAction SilentlyContinue)
  {
    Set-Alias vi vim
  }
}
