set guioptions-=m  " remove menu bar
set guioptions-=T  " remove tool bar
set guioptions-=r  " remove scroll bar

if has('win32')
  set guifont=JetBrainsMono_NF:h10
else
  set guifont=Cascadia\ Code\ PL:h14
endif
set lines=36 columns=150
