vim.cmd [[
try
  colorscheme falcon
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
