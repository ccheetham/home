let g:lightline = {
\   'colorscheme': 'onehalfdark',
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ],
\           [ 'filename', 'readonly', 'gitbranch', 'modified' ]
\       ]
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head'
\   },
\}
