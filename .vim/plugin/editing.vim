set nowrap                              " don't wrap lines
set foldlevelstart=1                    " initial fold level
set foldmethod=syntax                   " use syntax to determine folds

set autoindent                          " put the cursor where it should be
set shiftwidth=4                        " spaces per indent
set tabstop=8                           " tab-formatted files expect this
set expandtab                           " spaces in lieu of tabs
set softtabstop=4                       " spaces when expanding tabs
set list                                " show TABs ...
set listchars=tab:._                    " ... as  .___
set bs=2                                " backspace over everything
set visualbell                          " quiet please

map <c-d> dd
noremap <cr> o<esc>
nmap <silent><leader>w :set invwrap<cr>
nmap <silent><leader>p :set invpaste<cr>:set paste?<cr>
map <silent><leader>f mzgg=G`z<cr>

set wildmenu                            " enhanced completion
