# =============================================================================
# shell tooling
# =============================================================================

Set-PSReadLineOption -Colors @{
    "Command" = "#5fafff"
    "Error" = [ConsoleColor]::DarkRed
    "Parameter" = "#835b83"
    "String" = "#87d787"
}

function tail
{
    if ($args.Count -eq 0)
    {
        "path not specified"
        return
    }
    if ($args.Count -gt 2)
    {
        "too many args"
        return
    }
    $path = $args[0]
    if ($args.Count -gt 1)
    {
        $lines = $args[1]
    }
    else
    {
        $lines = "0"
    }

    Get-Content $path -Tail $lines -Wait
}

function which
{
    if ($args.Count -eq 0)
    {
        "path not specified"
        return
    }
    if ($args.Count -gt 1)
    {
        "too many args"
        return
    }

    (Get-Command "$args[0])[0].Path" -ErrorAction SilentlyContinue)
}
