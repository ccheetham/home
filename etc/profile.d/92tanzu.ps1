# =============================================================================
# VMware Tanzu
# =============================================================================

$Env:TANZU_REPOS = "$Env:HUB_SOURCES\vmware-tanzu"

function vt { cd "$Env:TANZU_REPOS" }
function dtc { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-vscode" }
function dtj { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-intellij" }
function dtl { cd "$Env:TANZU_REPOS\tanzu-developer-tools-language-server" }
function dts { cd "$Env:TANZU_REPOS\tanzu-developer-tools-for-visual-studio" }
function aas { cd "$Env:TANZU_REPOS\application-accelerator-samples" }

function dtslog { tail "$Env:LOCALAPPDATA\Microsoft\VisualStudio\17.0_84b9b701Exp\Extensions\VMware\Tanzu Developer Tools\0.0.0\tanzu-dev-tools.log" }
function dtslslog { tail "$Env:LOCALAPPDATA\Microsoft\VisualStudio\17.0_84b9b701Exp\Extensions\VMware\Tanzu Developer Tools\0.0.0\tanzu-language-server.log" }

function tme { tanzu --namespace ccheetham $args }
function twg { tanzu -n ccheetham apps workload get $args }
function twl { tanzu -n ccheetham apps workload list $args }

$ME_PATH = "$ME_PATH;$STEELTOE_INCUBATOR_REPOS\tanzu-thingies\local\bin"
