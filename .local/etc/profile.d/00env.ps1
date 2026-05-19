$Env:ME=Resolve-Path "$PSScriptRoot\..\.."
$Env:ME_CONFIG_DIR="$Env:ME\etc"
$Env:ME_SRC_DIR="$Env:ME\src"
$Env:ME_LIB_DIR="$Env:ME\lib"
$Env:ME_LIBEXEC_DIR="$Env:ME\libexec"
$Env:ME_DATA_DIR="$Env:ME\share"
$Env:ME_CACHE_DIR="$Env:ME\var"
$Env:ME_LOG_DIR="$Env:ME_CACHE_DIR\log"
$Env:ME_REPO_CFG="$Env:ME_CONFIG_DIR\repos"
$Env:ME_REPO_DIR="$Env:ME_CACHE_DIR\repos"
$Env:ME_MAIL_DIR="$Env:ME_CACHE_DIR\mail"
$Env:ME_DISTFILE_DIR="$Env:ME\xfr"

# TODO: actually detect OS et al
$Env:ME_OS="windows"
$Env:ME_DISTRO_FLAVOR="$Env:ME_OS"
$Env:ME_DISTRO_VERSION="3"
$Env:ME_PLATFORM="$Env:ME_OS-x64"

$Env:ME_TOOL_DIR="$Env:ME\local"
$Env:ME_PLATFORM_TOOL_DIR="$Env:ME_TOOL_DIR"
$Env:ME_DISTRO_TOOL_DIR="$Env:ME_TOOL_DIR"
$Env:ME_OPT_DIR="$Env:ME_TOOL_DIR\opt"

# XDG
$Env:XDG_CONFIG_HOME="$Env:ME_CONFIG_DIR"
$Env:XDG_DATA_HOME="$Env:ME_DATA_DIR"
$Env:XDG_CACHE_HOME="$Env:ME_CACHE_DIR"
$Env:XDG_STATE_HOME="$Env:XDG_CACHE_HOME\state"

function reenv {
    . "$PROFILE"
}

function pd {
    Set-Location "$Env:ME_CONFIG_DIR\profile.d"
}

