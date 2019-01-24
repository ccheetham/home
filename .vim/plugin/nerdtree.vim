" ============================================================================
" tree explorer
" https://github.com/scrooloose/nerdtree
" ============================================================================

let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
let NERDTreeBookmarksFile = expand('~/var/vim/bookmarks')
map <silent><leader><leader> :NERDTreeToggle<cr>
