# =============================================================================
# Go
# -----------------------------------------------------------------------------
# https://golang.org/
# =============================================================================

$Env:GOROOT = "$Env:ME_PLATFORM_TOOL_DIR\go\goroot"
$Env:GOPATH = "$Env:ME_PLATFORM_TOOL_DIR\go\gopath"

$ME_PATH = "$ME_PATH;$Env:GOPATH\bin;$Env:GOROOT\bin"
