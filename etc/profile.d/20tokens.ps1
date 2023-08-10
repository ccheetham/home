function Get-Token() {
    param(
        [Parameter()]
        [string]$TokenName
    )

    if (!$TokenName) {
      "token name not specified"
      return
    }

    $TokenDir = "$env:XDG_CONFIG_HOME\tokens"
    $TokenPath = "$TokenDir\$TokenName"

    if (!(Test-Path $TokenPath)) {
      return
    }

    Get-Content "$TokenPath"
}
