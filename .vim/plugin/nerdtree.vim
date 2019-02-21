" ============================================================================
" tree explorer
" https://github.com/scrooloose/nerdtree
" ============================================================================

let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
let NERDTreeBookmarksFile = $XDG_CACHE_DIR.'/vim/bookmarks'
map <silent><leader><leader> :NERDTreeToggle<cr>
