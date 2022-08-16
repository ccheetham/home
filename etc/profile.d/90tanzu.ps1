# =============================================================================
# VMware Tanzu
# =============================================================================

$Tanzu_Repos="$Env:ME_SRC_DIR/github.com/vmware-tanzu"

function vt { cd "$Tanzu_Repos" }
function vtap { cd "$Tanzu_Repos/tanzu-developer-tools-for-visual-studio" }
function vtas { cd "$Tanzu_Repos/tanzu-toolkit-for-visual-studio" }
