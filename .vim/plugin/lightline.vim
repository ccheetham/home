let g:lightline = {
            \   'colorscheme': 'onehalfdark',
            \   'active': {
            \     'left': [ ['mode', 'paste'], ['readonly', 'gitbranch', 'modified', 'fileinfo', 'filename'] ],
            \     'right': [ ['lineinfo'], ['fileformat', 'filencoding', 'filetype'], ['linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings'] ]
            \   },
            \   'inactive': {
            \     'left': [ [ 'pwd' ] ],
            \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ], [ 'scrollbar' ] ],
            \   },
            \   'component_expand': {
            \     'buffers': 'lightline#bufferline#buffers',
            \     'trailing': 'lightline#trailing_whitespace#component',
            \     'linter_ok': 'lightline#ale#ok',
            \     'linter_checking': 'lightline#ale#checking',
            \     'linter_warnings': 'lightline#ale#warnings',
            \     'linter_errors': 'lightline#ale#errors',
            \   },
            \   'component_function': {
            \     'gitbranch': 'fugitive#head',
            \     'pwd': 'LightlineWorkingDirectory',
            \     'scrollbar': '_scrollbar'
            \   },
            \   'component_type': {
            \     'linter_checking': 'left',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'left'
            \   }
            \ }
