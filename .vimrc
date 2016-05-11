" ============================================================================
" vim setup and configuration
" ============================================================================

set nocompatible                        " um, no

source ~/.vimrc.plugins

set shell=zsh                           " override what system thinks I want

syntax on                               " color please

set laststatus=2                        " always display status line
set showmode                            " show current mode
set relativenumber                      " relative line numbers ...
set number                              " ... but show current line as absolute
set numberwidth=3                       " line number gutter width
set ruler                               " cursor line/column number,
set cursorline cursorcolumn             " crosshairs
if exists('+colorcolumn')               " indicates advised widths
    let &colorcolumn="80,".join(range(120,999),",")
endif
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

" control
map QQ :quitall<cr>

" editing
map <c-d> dd
nmap <silent><leader>n :set invnumber<cr>
nmap <silent><leader>rn :set relativenumber!<cr>
nnoremap <silent><leader>c :set cursorline! cursorcolumn! <cr>
nmap <silent><leader>h :set invhlsearch<cr>
nmap <silent><leader>w :set invwrap<cr>
nmap <silent><leader>p :set invpaste<cr>:set paste?<cr>
map <silent><leader>f mzgg=G`z<cr>
nmap <c-n> :cnext<cr>
nmap <c-m> :cprev<cr>

" vimrc mamagement
nmap <silent><leader>ev :edit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>

" python
nmap <silent><leader>y :w !python<cr>

" insert timestamp (YY/MM/DD hh:mm)
:nnoremap <silent><leader>ts "=strftime("%D %R")<cr>P

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
