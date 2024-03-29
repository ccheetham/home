" ============================================================================
" vim setup and configuration
" ============================================================================

set nocompatible

if ! filereadable($ME_REPO_DIR.'/vim-plug/plug.vim')
  echo "vim-plug repo not found; try 'refresh vim'"
  finish
endif

source $ME_REPO_DIR/vim-plug/plug.vim
call plug#begin($XDG_CACHE_HOME.'/vim/plugins')
Plug 'editorconfig/editorconfig-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-utils/vim-man'
Plug 'airblade/vim-gitgutter'
" Plug 'APZelos/blamer.nvim'
Plug 'zivyangll/git-blame.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'mrk21/yaml-vim'
Plug 'vim-scripts/bats.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()

" use spacebar to trigger keymaps
let mapleader=" "

" config management
nmap <silent><leader>ec :edit $MYVIMRC<cr>
nmap <silent><leader>sc :source $MYVIMRC<cr>

" colorscheme
syntax on
if exists('+termguicolors')
  set termguicolors
endif
colorscheme onehalfdark
highlight Comment cterm=italic
highlight CursorLine cterm=underline
highlight CursorLineNr cterm=underline

" airline
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts=1


" quitting
map <leader>q :quitall<cr>
map <leader>bd :bp\|bd #<cr>

" editing
set encoding=utf-8
set autoindent                          " put the cursor where it should be
set tabstop=8                           " tab-formatted files expect this
set list                                " show TABs ...
set listchars=tab:.\                    " ... as  .___
set bs=2                                " backspace over everything
set visualbell                          " quiet please
set nowrap                              " don't wrap lines
set foldmethod=marker                   " I control when to fold
set wildmenu                            " enhanced completion
map <c-d> dd
noremap <cr> o<esc>
nmap <silent><leader>w :set invwrap<cr>
nmap <silent><leader>p :set invpaste<cr>:set paste?<cr>
map <silent><leader>f mzgg=G`z<cr>

" navigation
nnoremap k gk
nnoremap j gj
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nmap <c-n> :cnext<cr>
nmap <c-N> :cprev<cr>
" set mouse=a                             " enable mouse for a(ll) modes
" set ttymouse=xterm2                     " xterm-like mouse handling (enables mouse scroll)
set scrolloff=4                         " minimal lines above/below cursor
set sidescroll=1                        " horizontal scroll column count
set sidescrolloff=8                     " minimal columns left/right cursor

" search
set incsearch                           " highlight search matches
nmap <silent><leader>h :set invhlsearch<cr>

" netrw
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

" status line
set laststatus=2                        " always display status line
set noshowmode                          " current mode displayed by lightline

" gutter
function! ToggleRelativeNumbers()
  set relativenumber!
  set number
endfunction
autocmd InsertEnter * call ToggleRelativeNumbers()
autocmd InsertLeave * call ToggleRelativeNumbers()
set numberwidth=3                       " line number gutter width
nmap <silent><leader>n :set number!<cr>
nmap <silent><leader>tg :GitGutterLineHighlightsToggle<cr>

" NERDTree and Tagbar
let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
let NERDTreeBookmarksFile = $XDG_CACHE_HOME.'/vim/bookmarks'
map <silent><leader><leader> :NERDTreeToggle<cr>
map <silent><leader>t :TagbarToggle<cr>

" rulers
set ruler                               " cursor line/column number,
set cursorline                          " highlight current line
set cursorcolumn                        " highlight current column
nnoremap <silent><leader>c :set cursorcolumn! <cr>
if exists('+colorcolumn')
  let &colorcolumn="80,".join(range(120,999),",")
endif

" command history
set history=50

" diff
set diffopt+=vertical                   " say 'no' to horizontal diffs

" state between vim sessions
set viminfo='10,\"100,:20,%,n$XDG_CACHE_HOME/vim/viminfo

if empty($VisualStudioVersion)
  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction
  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END
endif

" use zsh if available
if executable('zsh')
  set shell=zsh
endif

" execute current file
nnoremap X :!%:p

" ALE linting
let g:ale_enabled = 0
let g:ale_open_list = 1
nnoremap <silent><leader>tl :ALEToggle<cr>

" man pages
nmap K :Man <c-r><c-w><cr>

" Enable autocomplete on startup
let g:deoplete#enable_at_startup = 1

" vim-commentary
map // :Commentary<cr>j

" vim-fugitive
nnoremap <silent><leader>gg :Gstatus<cr>
nnoremap <silent><leader>gd :Gdiff<cr>
nnoremap <silent><leader>gc :Gcommit<cr>
nnoremap <silent><leader>gp :Gpush<cr>

" prefer silver_searcher over grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_working_path_mode = 'r'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
"  let g:ctrlp_extensions = ['line']
endif
"
" " Git blamer
" let g:blamer_enabled = 1
" let g:blamer_delay = 0750
" let g:blamer_date_format = '%m/%d/%y'
" let g:blamer_show_in_insert_modes = 0

" git-blame
nnoremap <silent><leader>b :<c-u>call gitblame#echo()<cr>
