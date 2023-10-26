if (Get-command "bat" -ErrorAction SilentlyContinue)
{
  Set-Alias cat bat
}
