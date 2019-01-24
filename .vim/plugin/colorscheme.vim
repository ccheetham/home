syntax on
colorscheme onehalfdark
highlight Comment cterm=italic
highlight CursorLine cterm=underline
highlight Folded cterm=bold,italic
set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
