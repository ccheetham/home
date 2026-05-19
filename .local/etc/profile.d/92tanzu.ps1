# =============================================================================
# VMware Tanzu
# =============================================================================

$Env:TANZU_REPOS = "$Env:HUB_SOURCES\vmware-tanzu"
$Env:_TANZU_DT_LOG = "$Env:ME_LOG_DIR\tanzu_dt.log"
$Env:_TANZU_LS_LOG = "$Env:ME_LOG_DIR\tanzu_ls.log"

function vtr { cd "$Env:TANZU_REPOS" }
function dtc { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-vscode" }
function dtd { cd "$Env:TANZU_REPOS\tanzu-developer-tools-dev-conventions" }
function dti { cd "$Env:TANZU_REPOS\desktop-integration" }
function dtj { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-intellij" }
function dtl { cd "$Env:TANZU_REPOS\tanzu-developer-tools-language-server" }
function dts { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-visual-studio" }
function aas { cd "$Env:ME_REPOS\application-accelerator-samples" }

function dtslog { tail "$Env:TANZU_DT_LOG" 3 }
function dtslslog { tail "$Env:TANZU_LS_LOG" 3 }

$ME_PATH = "$ME_PATH;$STEELTOE_INCUBATOR_REPOS\tanzu-thingies\local\bin"

function twl { & tanzu apps workload list $Args }
function twg { & tanzu apps workload get $Args }
function twd { & tanzu apps workload delete $Args }
function twt { & tanzu apps workload tail --timestamp $Args }
