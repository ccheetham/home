" ============================================================================
" vim setup and configuration
" ============================================================================

set nocompatible
let mapleader=" "
set viminfo='10,\"100,:20,%,n~/var/vim/viminfo

if filereadable(expand("~/var/repo/vim-plug/plug.vim"))
    source ~/var/repo/vim-plug/plug.vim
    call plug#begin($XDG_CACHE_HOME.'/vim/plugins')
    Plug 'sheerun/vim-polyglot',
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'itchyny/lightline.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'majutsushi/tagbar'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-scripts/bats.vim'
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    Plug 'luan/vim-concourse'
    call plug#end()
else
    echo "vim-plug repo not found; try 'refresh vim'"
endif
