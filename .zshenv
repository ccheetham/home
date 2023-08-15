# =============================================================================
# zshenv
# -----------------------------------------------------------------------------
# vars available to all programs
# =============================================================================

export EDITOR="vi"
export VISUAL="vi -f"
if command -v less >/dev/null; then
  export PAGER=less
fi

# -----------------------------------------------------------------------------
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# -----------------------------------------------------------------------------
export XDG_CONFIG_HOME=~/etc
export XDG_DATA_HOME=~/share
export XDG_CACHE_HOME=~/var
export XDG_STATE_HOME=$XDG_CACHE_HOME/state
