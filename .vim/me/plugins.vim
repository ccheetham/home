" ============================================================================
" vim-plug setup and configuration
" https://github.com/junegunn/vim-plug
" ============================================================================

if filereadable(expand("~/var/repo/vim-plug/plug.vim"))
    source ~/var/repo/vim-plug/plug.vim
    call plug#begin("~/.vim/me/plugins")
    Plug 'jnurmine/Zenburn'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'majutsushi/tagbar'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-scripts/bats.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'elzr/vim-json'
    Plug 'luan/vim-concourse'
    call plug#end()
endif
