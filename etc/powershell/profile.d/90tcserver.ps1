# =============================================================================
# tc Server
# =============================================================================

$Env:TCS_QA="$Env:ME_SRC_DIR\gitlab.eng.vmware.com\tc-server\tcs-tc-server-qa"

function tcd { cd "${Env:TCS_QA}" }
