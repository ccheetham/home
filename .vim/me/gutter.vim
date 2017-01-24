"set relativenumber                      " relative line numbers ...
set number                              " ... but show current line as absolute
function! ToggleRelativeNumbers()
    set relativenumber!
    set number
endfunction
autocmd InsertEnter * call ToggleRelativeNumbers()
autocmd InsertLeave * call ToggleRelativeNumbers()
set numberwidth=3                       " line number gutter width

nmap <silent><leader>tg :GitGutterLineHighlightsToggle<cr>
