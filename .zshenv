# ===========================================================================
# ZSH configutation
# ===========================================================================

# ---------------------------------------------------------------------------
# Options: http://zsh.sourceforge.net/Doc/Release/Options.html
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# cd
# ---------------------------------------------------------------------------
setopt autocd                   # if cmd not found but is dir, cd to that dir
setopt auto_pushd               # cd pushes previous dir on stack
setopt pushd_ignore_dups        # only one instance of dir in stack
setopt pushd_silent             # don't print stack after pushd/popd
setopt pushd_to_home            # pushd with no args == pushd $HOME

# ---------------------------------------------------------------------------
# completion
# defaults seem adequate
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# expansion
# ---------------------------------------------------------------------------
setopt extended_glob            # treat #~^ as filename patterns
setopt bad_pattern              # print error on bad patterns

# ---------------------------------------------------------------------------
# history
# ---------------------------------------------------------------------------
setopt append_history           # append to history rather than replace
setopt bang_hist                # textual history expansion via !
setopt extended_history         # timestamp cmd
setopt hist_fcntl_lock          # use fcntl locking; prevents NFS corruption
setopt hist_ignore_all_dups     # if new cmd is dup, remove older one
setopt hist_no_store            # remove history from history (lingers 1 cmd)
setopt hist_reduce_blanks       # remove superfluous blanks

# ---------------------------------------------------------------------------
# io
# ---------------------------------------------------------------------------
setopt noclobber                # > can't truncate, >> can't create
setopt check_jobs               # status of bg/suspended jobs on exit
setopt no_hup                   # don't sent HUP to running jobs on exit
setopt notify                   # report jobs status imemediately

# ---------------------------------------------------------------------------
# prompt
# ---------------------------------------------------------------------------
setopt prompt_bang              # ! in prompt expansion
setopt prompt_subst             # eval params, cmds, etc in prompts

# ---------------------------------------------------------------------------
# zle (zsh line editor)
# ---------------------------------------------------------------------------
setopt no_beep                  # don't beep on error
setopt share_history            # imports new cmds and append typed ones

# ---------------------------------------------------------------------------
# 3rd party options
# ---------------------------------------------------------------------------

skip_global_compinit=1          # defer compinit to me (debian derivatives)


setopt HIST_FCNTL_LOCK
