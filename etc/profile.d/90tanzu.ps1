# =============================================================================
# VMware Tanzu
# =============================================================================

$Tanzu_Repos="$Env:ME_SRC_DIR/github.com/vmware-tanzu"

function vt { cd "$Tanzu_Repos" }
function vtc { cd "$Tanzu_Repos/tanzu-toolkit-for-vscode" }
function vtj { cd "$Tanzu_Repos/tanzu-toolkit-for-intellij" }
function vtl { cd "$Tanzu_Repos/tanzu-toolkit-language-server" }
function vts { cd "$Tanzu_Repos/tanzu-developer-tools-for-visual-studio" }
