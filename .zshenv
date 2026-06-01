# =============================================================================
# zshenv
# -----------------------------------------------------------------------------
# vars available to all programs
# =============================================================================

if [[ -f "/opt/homebrew/bin/nvim" ]]; then
  export EDITOR="/opt/homebrew/bin/nvim"
  export VISUAL="/opt/homebrew/bin/nvim -f"
elif command -v vim > /dev/null; then
  export EDITOR="nvim"
  export VISUAL="nvim -f"
else
  export EDITOR="vi"
fi

if command -v less > /dev/null; then
  export PAGER=less
fi

# -----------------------------------------------------------------------------
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# -----------------------------------------------------------------------------

export ME_LOCAL_HOME=~/.local
export ME_LOCAL_CONFIG_HOME=~/.local/etc
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=$ME_LOCAL_HOME/share
export XDG_CACHE_HOME=$ME_LOCAL_HOME/var
export XDG_STATE_HOME=$XDG_CACHE_HOME/state
