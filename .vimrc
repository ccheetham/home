set nocompatible

call pathogen#infect()

filetype on                       " enable file detection
filetype plugin on                " load plugins for specific file types
filetype indent on                " load indent spec for specific file types

" syntax colors please
syntax on

" indentation
set autoindent          " put the cursor where I'm thinking of next
set expandtab           " spaces in lieu of TABs
set tabstop=2           " 2 spaces worth for a TAB
set shiftwidth=2        " number of spaces per indent
set list                " show TABs as

" line/col numbering
set number
nmap <leader>n :set invnumber<cr>
nmap <leader>rn :set relativenumber<cr>
set ruler
set numberwidth=3

" line/col highlighting
if version >= 703
  set colorcolumn=80
endif
nnoremap <leader>c :set cursorline! cursorcolumn! <cr>

" searching
set incsearch
nmap <leader>h :set invhlsearch<cr>

" status bar
set laststatus=2                " always display status line
set showmode                    " tell me what mode I'm in

" remembering twixt sessions
"  'N   :  marks will be remembered for up to N previously edited files
"  "N   :  will save up to N lines for each register
"  :N   :  up to N lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
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

" style aids
set listchars=tab:._    "   .___

" edit/source vimrc
nmap <silent> <leader>ev :edit $MYVIMRC<cr>
nmap <silent> <leader>sv :source $MYVIMRC<cr>

" insert timestamp (YY/MM/DD hh:mm)
:nnoremap <leader>ts "=strftime("%D %R")<cr>P

" toggle paste mode
nmap <leader>p :set invpaste<cr>:set paste?<cr>

" toggle wrap mode
nmap <leader>w :set invwrap<cr>

" NERDTree
map <leader>t :NERDTreeToggle<cr>
autocmd vimenter * if !argc() | NERDTree | endif

" misc
set wildmenu                    " enhanced completion
set bs=2                        " backspacing over everything in insert mode
set visualbell                  " quiet please
set history=50                  " 50 lines of command history

if has('gui_running')
  set background=light
  colorscheme Tomorrow
else
  set background=dark
  colorscheme Tomorrow-Night
endif
