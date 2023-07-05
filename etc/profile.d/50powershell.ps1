Set-PSREadLineOption -HistorySavePath "${Env:XDG_CACHE_HOME}\powershell\history"

Set-PSReadLineOption -Colors @{
    "Command" = "#5fafff"
    "Error" = [ConsoleColor]::DarkRed
    "Parameter" = "#835b83"
    "String" = "#87d787"
}
