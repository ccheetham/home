# =============================================================================
# Cloud Foundry
# =============================================================================

$Env:CF_REPOS = "$Env:HUB_SOURCES\pivotal-cf"

function cfr { cd "$Env:CF_REPOS" }
function kbp { cd "$Env:CF_REPOS\kerberos-buildpack" }
