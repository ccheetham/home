Set-PSREadLineOption -HistorySavePath "${Env:XDG_CACHE_HOME}\powershell\history"

Set-PSReadLineOption -Colors @{
    "Command" = "#5fafff"
    "Error" = [ConsoleColor]::DarkRed
    "Parameter" = "#835b83"
    "String" = "#87d787"
}

# use native exes
if (Get-Command "Remove-Alias" -ErrorAction SilentlyContinue) {
 foreach ($alias in "curl", "wget") {
        if (Test-Path Alias:$alias) {
            Remove-Alias $alias
        }
    }
}

function tail {
    if ($args.Count -eq 0) {
        "path not specified"
        return
    }
    if ($args.Count -gt 2) {
        "too many args"
        return
    }
    $path = $args[0]
        if ($args.Count -gt 1) {
            $lines = $args[1]
        }
        else {
            $lines = "0"
        }
    Get-Content $path -Tail $lines -Wait
}

function which {
    foreach ($command in $args) {
        $path = Get-Command $command -ErrorAction SilentlyContinue
        if (!($path)) {
            continue
        }
        switch ($path.CommandType) {
            "Application" { $path.Source }
            "Alias" { $path.DisplayName }
            Default { "unknown type ($command): $($path.CommandType)" }
        }
    }
}