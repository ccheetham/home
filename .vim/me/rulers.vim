set ruler                               " cursor line/column number,
set cursorline                          " highlight current line
nnoremap <silent><leader>c :set cursorcolumn! <cr>
if exists('+colorcolumn')               " indicates advised widths
    let &colorcolumn="80,".join(range(120,999),",")
endif
