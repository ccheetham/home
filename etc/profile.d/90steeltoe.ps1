# =============================================================================
# Steeltoe
# =============================================================================

$Steeltoe_Repos="$Env:ME_SRC_DIR\github.com\SteeltoeOSS"
$Steeltoe_Incubator_Repos="$Env:ME_SRC_DIR\github.com\steeltoeoss-incubator"

function st { cd "$Steeltoe_Repos" }
function stl { cd "$Steeltoe_Repos\Steeltoe" }
function sts { cd "$Steeltoe_Repos\Samples" }
function std { cd "$Steeltoe_Repos\Dockerfiles" }
function stt { cd "$Steeltoe_Repos\Tooling" }
function sti { cd "$Steeltoe_Repos\InitializrWorkspace" }
function stiw { cd "$Steeltoe_Repos\InitializrWorkspace\InitializrWeb" }
function stic { cd "$Steeltoe_Repos\InitializrWorkspace\InitializrConfig" }
function stik { cd "$Steeltoe_Repos\InitializrWorkspace\InitializrConfigServer" }
function stis { cd "$Steeltoe_Repos\InitializrWorkspace\InitializrService" }
function ntt { cd "$Steeltoe_Repos\InitializrWorkspace\NetCoreToolTemplates" }
function nts { cd "$Steeltoe_Repos\InitializrWorkspace\NetCoreToolService" }

function stinc { cd "$Steeltoe_Incubator_Repos" }
function tt { cd "$Steeltoe_Incubator_Repos\tanzu-thingies" }
function dtg { cd "$Steeltoe_Incubator_Repos\dotnet-tap-gitops" }
