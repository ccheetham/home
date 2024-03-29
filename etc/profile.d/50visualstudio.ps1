function Open-In-Visual-Studio
{
  [CmdletBinding()]
  param (
      [Parameter()]
      [string]
      $Target
  )

  if (!($Target))
  {
    $targets = Get-ChildItem . -Filter *.sln
    if ($targets.Count -gt 1)
    {
      "more than one solution found; pass solution as argument"
      return
    }
    if ($targets.Count -eq 0)
    {
      $targets = Get-ChildItem . -Filter *.csproj
    }
    if ($targets.Count -gt 1)
    {
      "more than one project found; pass project as argument"
      return
    }
    if ($targets.Count -eq 0)
    {
      "no solution or project found"
      return
    }
    $Target = $targets[0]
  }

  start devenv $Target
}

Set-Alias vs Open-In-Visual-Studio
