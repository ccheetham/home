# =============================================================================
# Steeltoe
# =============================================================================

$SteeltoeRepos="$Env:UserProfile\src\SteeltoeOSS"

function std {
  cd "$SteeltoeRepos\Dockerfiles"
}

function stia {
  cd "$SteeltoeRepos\InitializrApi"
}

function stiw {
  cd "$SteeltoeRepos\InitializrWeb"
}

function sts {
  cd "$SteeltoeRepos\Samples"
}
