" ============================================================================
" vim setup and configuration
" ============================================================================

set nocompatible                        " um, no
syntax on                               " color, et al please

let mapleader=" "                       " \ is a bit archaic

if executable('zsh')
  set shell=zsh                         " override what system thinks I want
endif

set laststatus=2                        " always display status line
set showmode                            " show current mode

set wildmenu                            " enhanced completion
set history=50                          " command history lines

set nowrap                              " don't wrap lines
set foldlevelstart=1                    " initial fold level
set incsearch                           "incremental search

set autoindent                          " put the cursor where it should be
set shiftwidth=4                        " spaces per indent
set tabstop=8                           " tab-formatted files expect this
set expandtab                           " spaces in lieu of tabs
set softtabstop=4                       " spaces when expanding tabs
set list                                " show TABs ...
set listchars=tab:._                    " ... as  .___
set bs=2                                " backspace over everything
set visualbell                          " quiet please

" column and line numbering
set ruler                               " cursor line/column number,
set cursorline                          " highlight current line
nnoremap <silent><leader>c :set cursorcolumn! <cr>
if exists('+colorcolumn')               " indicates advised widths
    let &colorcolumn="80,".join(range(120,999),",")
endif
set relativenumber                      " relative line numbers ...
set number                              " ... but show current line as absolute
function! ToggleRelativeNumbers()
    set relativenumber!
    set number
endfunction
autocmd InsertEnter * call ToggleRelativeNumbers()
autocmd InsertLeave * call ToggleRelativeNumbers()
set numberwidth=3                       " line number gutter width

" editing
map <c-d> dd
noremap <cr> o<esc>
nmap <silent><leader>h :set invhlsearch<cr>
nmap <silent><leader>w :set invwrap<cr>
nmap <silent><leader>p :set invpaste<cr>:set paste?<cr>
map <silent><leader>f mzgg=G`z<cr>

" error navigation
nmap <c-n> :cnext<cr>
nmap <c-m> :cprev<cr>

" simplify cursor window movement
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" scrolling
set scrolloff=4
set sidescroll=1
set sidescrolloff=8

" resize windows
nnoremap <right> :vertical resize +1<cr>
nnoremap <left> :vertical resize -1<cr>
nnoremap <up> :resize +1<cr>
nnoremap <down> :resize -1<cr>

" when lines wrapper, navigate as one would expect
nnoremap k gk
nnoremap j gj

" say 'no' to horizontal diffs, even if window too narrow
set diffopt+=vertical

" control
map <leader>q :quit<cr>
map <leader>bd :bp\|bd #<cr>

" vimrc mamagement
nmap <silent><leader>ev :edit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
nmap <silent><leader>eg :edit $MYGVIMRC<cr>
nmap <leader>sg :source $MYGVIMRC<cr>
nmap <silent><leader>ep :edit $MYVIMRC.plugins<cr>
nmap <leader>sp :source $MYVIMRC.plugins<cr>

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

source ~/.vimrc.plugins                 " plugins and their settings
