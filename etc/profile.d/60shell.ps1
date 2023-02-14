# =============================================================================
# shell tooling
# =============================================================================

function tail
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

    Get-Content $args[0] -Tail 1 -Wait
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

    (Get-Command $args[0])[0].Path
}
