set guioptions-=m  " remove menu bar
set guioptions-=T  " remove tool bar
set guioptions-=r  " remove scroll bar

if has("gui_macvim")
    " MacVim on OSX
    set guifont=Monaco:h12
else
    " GVim on Windows (assumed)
    set guifont=Consolas:h11
endif
