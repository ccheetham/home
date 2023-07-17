$Env:SCOOP="$Env:ME_TOOL_DIR\scoop"
$Env:SCOOP_CACHE="$Env:XDG_CACHE_HOME\scoop"

function scsync {
    scoop update
    scoop update --all
    scoop cleanup --all
}
