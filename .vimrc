if has('unix')
    if system('uname') =~ 'Darwin'
        let os = 'mac'
    else
        let os = 'unix'
    endif
endif

set nocompatible                        " um, no

filetype off                            " disable prior to Vundle setup

set rtp+=~/var/repo/Vundle.vim          " Vundle plugin manager ...
call vundle#begin()                     " https://github.com/gmarik/Vundle.vim

Plugin 'gmarik/Vundle.vim'              " this and ...
Plugin 'pathogen.vim'                   " ... that setup Vundle plugin mgmt
Plugin 'asciidoc.vim'                   " AsciiDoc syntax
Plugin 'tfnico/vim-gradle'              " Gradle systax
Plugin 'nginx.vim'                      " nginx web server syntax
Plugin 'scrooloose/nerdtree'            " filesystem explorer
Plugin 'ctrlp.vim'                      " fuzzy file/buffer finder
Plugin 'ivanov/vim-ipython'             " interact with iPython
Plugin 'airblade/vim-gitgutter'         " Git Gutter
Plugin 'MarcWeber/vim-addon-mw-utils'   " dependency for ...
Plugin 'tomtom/tlib_vim'                " ... and another dependency for ...
Plugin 'SirVer/ultisnips'               " ... UltiSnips snippet framework
Plugin 'honza/vim-snippets'             " snippets for SnipMate
"if os == 'mac'
"    Plugin 'Valloric/YouCompleteMe'     " autocomplete as you type
"endif

call vundle#end()
call pathogen#infect()

filetype on                             " enable file detection
filetype plugin on                      " load plugins
filetype indent on                      " indentation

syntax on                               " color please
colorscheme cheetos                     " my colors

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

let NERDTreeIgnore = ['\.pyc$']         " ignore these files in NerdTree

au BufNewFile,BufRead *.adoc setlocal ft=asciidoc       " addt'l asciidoc exts

" grepping
if executable('ag')                     " use silver searcher if available
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" edit vimrc
nmap <silent><leader>ev :edit $MYVIMRC<cr>
" source vimrc
nmap <leader>sv :source $MYVIMRC<cr>
" toggle line numbers
nmap <leader>n :set invnumber<cr>
" toggle relativeline line numbers
nmap <leader>rn :set relativenumber!<cr>
" toggle crosshairs
nnoremap <leader>c :set cursorline! cursorcolumn! <cr>
" toggle search highlighting
nmap <leader>h :set invhlsearch<cr>
" toggle wrap mode
nmap <leader>w :set invwrap<cr>
" toggle paste mode
nmap <leader>p :set invpaste<cr>:set paste?<cr>
" format buffer
map <silent><leader>f mzgg=G`z<cr>
" next error
nmap <c-n> :cnext<cr>
" previous error
nmap <c-m> :cprev<cr>
" git gutter
nmap <leader>gg :GitGutterLineHighlightsToggle<cr>
" execute python on current buffer
nmap <silent><leader>q :w !python<cr>
" insert timestamp (YY/MM/DD hh:mm)
:nnoremap <leader>ts "=strftime("%D %R")<cr>P
" toggle NerdTree window
map <leader>t :NERDTreeToggle<cr>

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

"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
