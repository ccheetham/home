$Env:DOTNET_ROOT="$Env:ME_PLATFORM_TOOL_DIR/dotnet"
$Env:DOTNET_CLI_TELEMETRY_OPTOUT="1"

$ME_PATH = "$ME_PATH;$Env:ME\.dotnet\tools"
$ME_PATH = "$ME_PATH;$Env:DOTNET_ROOT"

Set-Alias dn dotnet
