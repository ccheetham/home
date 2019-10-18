" ============================================================================
" nvim setup and configuration
" ============================================================================

set nocompatible
let mapleader=" "
set shada=!,'10,/100,:100,<0,@1,f1,h,s1,%10
if ! filereadable(stdpath('data') . '/site/autoload/plug.vim')
  echo "vim-plug repo not found; try 'refresh vim'"
  finish
endif
call plug#begin(stdpath('data') . '/plugged')
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot',
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'vim-scripts/bats.vim'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'luan/vim-concourse'
call plug#end()


" restore position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" editing
set nowrap                              " don't wrap lines
set foldmethod=manual                   " I control when to fold
set autoindent                          " put the cursor where it should be
set shiftwidth=4                        " spaces per indent
set tabstop =8                           " tab-formatted files expect this
set expandtab                           " spaces in lieu of tabs
set softtabstop=4                       " spaces when expanding tabs
set list                                " show TABs ...
set listchars=tab:.\                    " ... as  .___
set bs=2                                " backspace over everything
set visualbell                          " quiet please
set diffopt+=vertical                   " say 'no' to horizontal diffs, even if window too narrow
set wildmenu                            " enhanced completion
set scrolloff=4
set sidescroll=1
set sidescrolloff=8
if executable('zsh')
  set shell=zsh
endif


" colorscheme
colorscheme onehalfdark
highlight Comment cterm=italic
" highlight CursorLine cterm=underline
" highlight CursorLineNr cterm=underline

" lightline
let g:lightline = {
      \   'colorscheme': 'onehalfdark',
      \   'active': {
      \     'left': [ ['mode', 'paste'], ['readonly', 'gitbranch', 'modified', 'fileinfo', 'filename'] ],
      \     'right': [ ['lineinfo'], ['fileformat', 'filencoding', 'filetype'], ['linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings'] ]
      \   },
      \   'inactive': {
      \     'left': [ [ 'pwd' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'trailing': 'lightline#trailing_whitespace#component',
      \     'linter_ok': 'lightline#ale#ok',
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \     'pwd': 'LightlineWorkingDirectory',
      \     'scrollbar': '_scrollbar'
      \   },
      \   'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left'
      \   }
      \ }
set laststatus=2                        " always display status line
set noshowmode                          " current mode displayed by lightline

" up/down thru wrapped text
nnoremap k gk
nnoremap j gj

" vim-commentary maps
map // :Commentary<cr>j

" vim-fugitive maps
nnoremap <silent><leader>gg :Gstatus<cr>
nnoremap <silent><leader>gd :Gdiff<cr>
nnoremap <silent><leader>gc :Gcommit<cr>
nnoremap <silent><leader>gp :Gpush<cr>

" NERDTree
let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
let NERDTreeBookmarksFile=stdpath('data') . '/nerdtree_bookmarks'
map <silent><leader><leader> :NERDTreeToggle<cr>

" rulers/gutters
set ruler                               " cursor line/column number,
set cursorline                          " highlight current line
set cursorcolumn                        " highlight current column
nnoremap <silent><leader>c :set cursorcolumn! <cr>
if exists('+colorcolumn')               " indicates advised widths
  let &colorcolumn="80,".join(range(120,999),",")
endif
set number
function! ToggleRelativeNumbers()
  set relativenumber!
  set number
endfunction
autocmd InsertEnter * call ToggleRelativeNumbers()
autocmd InsertLeave * call ToggleRelativeNumbers()
set numberwidth=3                       " line number gutter width

nmap <silent><leader>n :set number!<cr>
nmap <silent><leader>tg :GitGutterLineHighlightsToggle<cr>

" search
set incsearch
nmap <silent><leader>h :set invhlsearch<cr>

" misc maps
map <leader>q :quitall<cr>
map <silent><leader>bd :bp\|bd #<cr>
map <c-d> dd
noremap <cr> o<esc>
nmap <silent><leader>w :set invwrap<cr>
nmap <silent><leader>p :set invpaste<cr>:set paste?<cr>
map <silent><leader>f mzgg=G`z<cr>
nmap <c-n> :cnext<cr>
nmap <c-m> :cprev<cr>
nnoremap <silent> <C-l> :nohl<cr>:GitGutter<cr><c-l>
