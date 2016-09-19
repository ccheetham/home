" ============================================================================
" solarized colorscheme
" https://github.com/altercation/vim-colors-solarized
" ============================================================================
if $TERM != 'sun-color'
    colorscheme solarized
    hi CursorLine term=underline cterm=underline ctermbg=none
endif

set background=dark
function! MeToggleBackground()
    if (&background == "light")
        set background=dark
    else
        set background=light
    endif
endfunction
map <silent><leader>tb :call MeToggleBackground()<cr>

highlight Comment cterm=italic
