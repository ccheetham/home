let g:lightline = {}
let g:lightline.colorscheme = 'onehalfdark'
let g:lightline.active = {
            \ 'left': [[ 'mode', 'paste' ], [ 'filename', 'readonly', 'gitbranch', 'modified' ]],
            \ 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
            \ }
let g:lightline.component_function = {
            \ 'gitbranch': 'fugitive#head'
            \ }
let g:lightline.component_expand = {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \ }
let g:lightline.component_type = {
            \     'linter_checking': 'left',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'left',
            \ }
