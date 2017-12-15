" ============================================================================
" vim setup and configuration
" ============================================================================

set nocompatible
syntax on

let mapleader=" "                       " \ is a bit archaic

map <leader>q :quit<cr>
map <leader>bd :bp\|bd #<cr>

" vimrc mamagement
nmap <silent><leader>ev :edit $MYVIMRC<cr>
nmap <silent><leader>sv :source $MYVIMRC<cr>
nmap <silent><leader>eg :edit $MYGVIMRC<cr>
nmap <silent><leader>ep :edit ~/.vim/me/plugins.vim<cr>

source ~/.vim/me/plugins.vim
source ~/.vim/me/colorscheme.vim
source ~/.vim/me/startup.vim
source ~/.vim/me/editing.vim
source ~/.vim/me/command.vim
source ~/.vim/me/search.vim
source ~/.vim/me/nerdtree.vim
source ~/.vim/me/tagbar.vim
source ~/.vim/me/navigate.vim
source ~/.vim/me/rulers.vim
source ~/.vim/me/windows.vim
source ~/.vim/me/scroll.vim
source ~/.vim/me/mouse.vim
source ~/.vim/me/errors.vim
source ~/.vim/me/diff.vim
source ~/.vim/me/shell.vim
source ~/.vim/me/commentary.vim
source ~/.vim/me/fugitive.vim
source ~/.vim/me/gutter.vim
source ~/.vim/me/silver_searcher.vim
source ~/.vim/me/statusline.vim
