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
      "token unknown: $TokenName"
      return
    }

    Get-Content "$TokenPath"
}
