$Env:HUB_SOURCES = "$Env:ME_REPO_DIR\github.com"

function hub
{
    cd "$Env:HUB_SOURCES"
}
