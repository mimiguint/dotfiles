source $MYVIMRC

if has('win32')
  set guifont=Ricty_Diminished:h12:cSHIFTJIS
elseif has('mac')
  set guifont=Ricty_Diminished:h12
else
  set guifont=Ricty_Diminished\ 12
endif

"set visualbell t_vb=
set lines=40
set columns=130
"set colorcolumn=80,120
set guioptions-=T
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l
set guioptions-=b
set guioptions-=m
set guioptions-=e
set showtabline=2

if has('multi_byte_ime') || has('xim')
  highlight CursorIM guifg=NONE guibg=DarkRed
endif
