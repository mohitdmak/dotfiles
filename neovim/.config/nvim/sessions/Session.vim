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
$argadd ~/Algos/
tabnew
tabnew
tabnew
tabnew
tabrewind
edit cpp/a1.cpp
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
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
argglobal
balt cpp/a1.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 38 - ((37 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 02|
wincmd w
argglobal
if bufexists("cpp/ainput.txt") | buffer cpp/ainput.txt | else | edit cpp/ainput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/ainput.txt
endif
balt cpp/a1.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists("cpp/aoutput.txt") | buffer cpp/aoutput.txt | else | edit cpp/aoutput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/aoutput.txt
endif
balt cpp/ainput.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
tabnext
edit cpp/a2.cpp
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
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
argglobal
balt cpp/log.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 34 - ((12 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 34
normal! 0
wincmd w
argglobal
if bufexists("cpp/ainput.txt") | buffer cpp/ainput.txt | else | edit cpp/ainput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/ainput.txt
endif
balt cpp/a2.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 11 - ((10 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 0
wincmd w
argglobal
if bufexists("cpp/aoutput.txt") | buffer cpp/aoutput.txt | else | edit cpp/aoutput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/aoutput.txt
endif
balt cpp/ainput.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
tabnext
edit cpp/log.txt
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit cpp/a3.cpp
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
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
argglobal
balt cpp/a3.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
argglobal
if bufexists("cpp/ainput.txt") | buffer cpp/ainput.txt | else | edit cpp/ainput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/ainput.txt
endif
balt cpp/a3.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists("cpp/aoutput.txt") | buffer cpp/aoutput.txt | else | edit cpp/aoutput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/aoutput.txt
endif
balt cpp/ainput.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
tabnext
edit cpp/a4.cpp
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
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
argglobal
balt cpp/a4.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 6 - ((5 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 04|
wincmd w
argglobal
if bufexists("cpp/ainput.txt") | buffer cpp/ainput.txt | else | edit cpp/ainput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/ainput.txt
endif
balt cpp/a4.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists("cpp/aoutput.txt") | buffer cpp/aoutput.txt | else | edit cpp/aoutput.txt | endif
if &buftype ==# 'terminal'
  silent file cpp/aoutput.txt
endif
balt cpp/ainput.txt
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=5
setlocal fml=1
setlocal fdn=3
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 110 + 86) / 173)
exe '2resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 62 + 86) / 173)
exe '3resize ' . ((&lines * 19 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 62 + 86) / 173)
tabnext 3
badd +1 cpp/a1.cpp
badd +1 ~/Algos/
badd +24 cpp/a2.cpp
badd +1 cpp/a3.cpp
badd +1 cpp/a4.cpp
badd +1 cpp/ainput.txt
badd +1 cpp/aoutput.txt
badd +1 cpp/log.txt
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFAI
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
