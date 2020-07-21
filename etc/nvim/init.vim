if ! filereadable($ME_REPO_DIR.'/vim-plug/plug.vim')
  echo "vim-plug repo not found; try 'refresh vim'"
  finish
endif

source $ME_REPO_DIR/vim-plug/plug.vim
call plug#begin($XDG_CACHE_HOME.'/nvim/plugins')
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot',
Plug 'mrk21/yaml-vim'
Plug 'vim-scripts/bats.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" use spacebar to trigger keymaps
let mapleader=" "

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

" colorscheme
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
highlight Comment cterm=italic
highlight CursorLine cterm=underline
highlight CursorLineNr cterm=underline

" command history
set history=50

" terminal
:tnoremap <esc> <c-\><c-n>

" state between vim sessions
set viminfo='10,\"100,:20,%,n$XDG_CACHE_HOME/nvim/viminfo
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

" navigation
nnoremap k gk
nnoremap j gj
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nmap <c-n> :cnext<cr>
nmap <c-N> :cprev<cr>
set mouse=a                             " enable mouse for a(ll) modes
set scrolloff=4                         " minimal lines above/below cursor
set sidescroll=1                        " horizontal scroll column count
set sidescrolloff=8                     " minimal columns left/right cursor

" search
set incsearch                           " highlight search matches
nmap <silent><leader>h :set invhlsearch<cr>

" netrw
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

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

" rulers
set ruler                               " cursor line/column number,
set cursorline                          " highlight current line
set cursorcolumn                        " highlight current column
nnoremap <silent><leader>c :set cursorcolumn! <cr>
if exists('+colorcolumn')
  let &colorcolumn="80,".join(range(120,999),",")
endif

" NERDTree and Tagbar
let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
let NERDTreeBookmarksFile = $XDG_CACHE_HOME.'/nvim/bookmarks'
map <silent><leader><leader> :NERDTreeToggle<cr>

" diff
set diffopt+=vertical                   " say 'no' to horizontal diffs

" ALE linting
let g:ale_open_list = 1
nnoremap <silent><leader>tl :ALEToggle<cr>

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

" ALE linter
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 5

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" completion
set completeopt=longest,menuone,preview

" deoplete
let g:deocomplete#enable_at_startup = 1

" OmniSharp
augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  autocmd FileType cs nmap <silent> <buffer> <Leader>fi <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <Leader>rr <Plug>(omnisharp_rename)

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

let g:OmniSharp_want_snippet=1
let g:OmniSharp_highlighting = 0
let g:OmniSharp_popup = 1

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 2000
let g:blamer_date_format = '%m/%d/%y'
