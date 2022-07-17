let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Algos
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd .
edit py/p1.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 128 + 96) / 192)
exe '2resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 2resize ' . ((&columns * 63 + 96) / 192)
exe '3resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 3resize ' . ((&columns * 63 + 96) / 192)
argglobal
balt py/log.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/Algos
wincmd w
argglobal
if bufexists("~/Algos/py/input.txt") | buffer ~/Algos/py/input.txt | else | edit ~/Algos/py/input.txt | endif
if &buftype ==# 'terminal'
  silent file ~/Algos/py/input.txt
endif
balt ~/Algos/py/output.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 3 - ((2 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
lcd ~/Algos
wincmd w
argglobal
if bufexists("~/Algos/py/output.txt") | buffer ~/Algos/py/output.txt | else | edit ~/Algos/py/output.txt | endif
if &buftype ==# 'terminal'
  silent file ~/Algos/py/output.txt
endif
balt ~/Algos/py/input.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 02|
lcd ~/Algos
wincmd w
exe 'vert 1resize ' . ((&columns * 128 + 96) / 192)
exe '2resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 2resize ' . ((&columns * 63 + 96) / 192)
exe '3resize ' . ((&lines * 19 + 21) / 42)
exe 'vert 3resize ' . ((&columns * 63 + 96) / 192)
tabnext 1
badd +1 ~/Algos/py/p1.py
badd +1 ~/Algos/py/input.txt
badd +1 ~/Algos/py/output.txt
badd +1 ~/Algos/py/log.txt
badd +1 ~/Algos/py/p2.py
badd +1 ~/Algos/py/p3.py
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=xTOnFcoftilI
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
