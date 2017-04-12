" ============================================================================
" tree explorer
" https://github.com/scrooloose/nerdtree
" ============================================================================

let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
let NERDTreeBookmarksFile = $HOME . '/.vim/nerdtree_bookmarks'
map <silent><leader><leader> :NERDTreeToggle<cr>
