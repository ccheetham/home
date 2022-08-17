$Env:SCOOP="$Env:ME_PLATFORM_TOOL_DIR\scoop"
$Env:SCOOP_CACHE="$Env:XDG_CACHE_HOME\scoop"

Set-Alias sc scoop

function scsync
{
  sc update
  sc update --all
  sc cleanup --all
}
