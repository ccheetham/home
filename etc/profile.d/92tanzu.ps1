# =============================================================================
# VMware Tanzu
# =============================================================================

$Env:TANZU_REPOS = "$Env:HUB_SOURCES\vmware-tanzu"

function vt { cd "$Env:TANZU_REPOS" }
function dtc { cd "$Env:TANZU_REPOS\tanzu-toolkit-for-vscode" }
function dtj { cd "$Env:TANZU_REPOS\tanzu-toolkit-for-intellij" }
function dtl { cd "$Env:TANZU_REPOS\tanzu-toolkit-language-server" }
function dts { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-visual-studio" }
function aas { cd "$Env:TANZU_REPOS\application-accelerator-samples" }


$ME_PATH = "$ME_PATH;$STEELTOE_INCUBATOR_REPOS\tanzu-thingies\local\bin"
