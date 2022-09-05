# =============================================================================
# VMware Tanzu
# =============================================================================

$Tanzu_Repos="$Env:ME_SRC_DIR/github.com/vmware-tanzu"

function vt { cd "$Tanzu_Repos" }
function vtvs { cd "$Tanzu_Repos/tanzu-developer-tools-for-visual-studio" }
function vtc { cd "$Tanzu_Repos/tanzu-toolkit-for-vscode" }
function vtij { cd "$Tanzu_Repos/tanzu-toolkit-for-intellij" }
function vtls { cd "$Tanzu_Repos/tanzu-toolkit-language-server" }
