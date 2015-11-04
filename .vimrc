set nocompatible                        " um, no

filetype off                            " disable prior to Vundle setup

set rtp+=$HOME/var/repo/Vundle.vim          " Vundle plugin manager ...
call vundle#begin()                     " https://github.com/gmarik/Vundle.vim

Plugin 'gmarik/Vundle.vim'              " this and ...
Plugin 'pathogen.vim'                   " ... that setup Vundle plugin mgmt
Plugin 'asciidoc.vim'                   " AsciiDoc syntax
Plugin 'tfnico/vim-gradle'              " Gradle systax
Plugin 'nginx.vim'                      " nginx web server syntax
"Plugin 'scrooloose/syntastic'            " syntax checker
Plugin 'scrooloose/nerdtree'            " filesystem explorer
Plugin 'TaskList.vim'                   " TODOs, FIXMEs, XXXs ...
Plugin 'ctrlp.vim'                      " fuzzy file/buffer finder
Plugin 'ivanov/vim-ipython'             " interact with iPython
"Plugin 'MarcWeber/vim-addon-mw-utils'   " dependency for ...
"Plugin 'tomtom/tlib_vim'                " ... and another dependency for ...
"Plugin 'SirVer/ultisnips'               " ... UltiSnips snippet framework
"Plugin 'honza/vim-snippets'             " snippets for SnipMate
Plugin 'airblade/vim-gitgutter'         " Git Gutter
"Plugin 'benmills/vimux'                 " interact with tmux
"Plugin 'pitluga/vimux-nose-test'         " ... nose testing
"Plugin 'reinh/vim-makegreen'
"Plugin 'kevinw/pyflakes-vim'

call vundle#end()
call pathogen#infect()

filetype on                             " enable file detection
filetype plugin on                      " load plugins
filetype indent on                      " indentation

set shell=zsh                           " override what system thinks I want

set rtp+=$HOME/var/repo/color-scheme/vim
colorscheme cheetos

syntax on                               " color please

set laststatus=2                        " always display status line
set showmode                            " show current mode
set number                              " line numbers
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

" nerdtree
let NERDTreeIgnore=['\.swp$', '\.pyc$', '__pycache__']
map <silent><leader>q :NERDTreeToggle<cr>

" tasklist
let g:tlWindowPosition=1                " open tasklist on the bottom

" asciidoc
au BufNewFile,BufRead *.adoc setlocal ft=asciidoc

" grep
if executable('ag')                     " use silver searcher if available
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" git
nmap <silent><leader>gg :GitGutterLineHighlightsToggle<cr>

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


"autocmd BufNewFile,BufRead *.py compiler nose
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
