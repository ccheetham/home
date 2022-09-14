# =============================================================================
# VMware Tanzu
# =============================================================================

$Env:TANZU_REPOS = "$Env:HUB_SOURCES\vmware-tanzu"

function vt { cd "$Env:TANZU_REPOS" }
function vtc { cd "$Env:TANZU_REPOS\tanzu-toolkit-for-vscode" }
function vtj { cd "$Env:TANZU_REPOS\tanzu-toolkit-for-intellij" }
function vtl { cd "$Env:TANZU_REPOS\tanzu-toolkit-language-server" }
function vts { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-visual-studio" }

function tt { cd "$Env:HUB_SOURCES/steeltoeoss-incubator/tanzu-thingies" }
