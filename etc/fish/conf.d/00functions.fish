# -----------------------------------------------------------------------------
# msg: display message to stdout
# -----------------------------------------------------------------------------
function msg
    echo "--- $argv"
end

# -----------------------------------------------------------------------------
# hdr: display header message to stdout
# -----------------------------------------------------------------------------
function hdr
    echo "=== $argv"
end

# -----------------------------------------------------------------------------
# err: display message to stderr
# -----------------------------------------------------------------------------
function err
    echo "!!! $argv" >&2
end

# -----------------------------------------------------------------------------
# die: exit with non-zero after displaying error (if any)
# -----------------------------------------------------------------------------
function die
    if [ (count $argv) -gt 0 ]
        err $argv
    end
    exit 1
end

# -----------------------------------------------------------------------------
# command_exists: return true/false if command exists/doesn't exists
# -----------------------------------------------------------------------------
function command_exists
  command -v $argv[1] >/dev/null
end

# -----------------------------------------------------------------------------
# link: ln helper
# -----------------------------------------------------------------------------
function link
  set src $argv[1]
  set tgt $argv[2]
  msg "linking $tgt -> $src"
  rm -f "$tgt"
  ln -s "$src" "$tgt"
end

# -----------------------------------------------------------------------------
# formatting
# -----------------------------------------------------------------------------

# bold
function B
    tput bold
    printf "%s" "$argv"
    tput sgr0
end

# underline
function U
    tput smul
    printf "%s" "$argv"
    tput rmul
end

# uppercase
function UPPER
    echo "$argv" | awk '{print toupper($0)}'
end

# code
function C
    tput bold
    printf "%s" "$argv"
    tput sgr0
end
