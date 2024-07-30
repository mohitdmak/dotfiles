vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd BufWinEnter * :set tabstop=4 shiftwidth=4 expandtab
    autocmd FileType qf set nobuflisted
    " autocmd BufWritePost a*.cpp Dispatch! g++ <afile> -fsanitize=address 2>/home/mohitdmak/algos/my/cpp/log.txt -o %:r
    " ALL => " autocmd BufWritePost a*.cpp Dispatch! g++ <afile> -Wall -Wconversion -Wshadow -Wfloat-equal -Wlogical-op -Wduplicated-cond -Wshift-overflow=2 -fsanitize=undefined -fsanitize=address -g -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -std=c++17 2>/home/mohitdmak/algos/my/cpp/log.txt -o %:r
    " Removing 'Wconversion' as too verbose and unnecessary
    " autocmd BufWritePost a*.cpp Dispatch! g++ <afile> 2>/home/mohitdmak/algos/my/cpp/log.txt -o %:r " without any flags
    " autocmd BufWritePost a*.cpp Dispatch! g++ <afile> -Wall -Wshadow -Wfloat-equal -Wlogical-op -Wduplicated-cond -Wshift-overflow=2 -fsanitize=undefined -fsanitize=address -g -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -std=c++17 2>/home/mohitdmak/algos/my/cpp/log.txt -o %:r " my goto setting
    autocmd BufWritePost a*.cpp Dispatch! make compile_%:r || (make cleanup_logs && exit 1)
    " autocmd BufWinEnter log.txt 
    "    \ :g/usr/d | 
    "    \ :w
  augroup end

  augroup remember_folds
    autocmd!
    au BufWinLeave p1.py mkview 1
    au BufWinEnter p1.py silent! loadview 1
    au BufWinLeave p2.py mkview 1
    au BufWinEnter p2.py silent! loadview 1
    au BufWinLeave p3.py mkview 1
    au BufWinEnter p3.py silent! loadview 1
    au BufWinLeave p4.py mkview 1
    au BufWinEnter p4.py silent! loadview 1
    au BufWinLeave *.cpp mkview 1
    au BufWinEnter *.cpp silent! loadview 1
    au BufWinLeave *.md mkview 1
    au BufWinEnter *.md silent! loadview 1
  augroup END

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _vimwiki
    autocmd!
    autocmd FileType vimwiki setlocal nowrap
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end

-- markdown block sets spell mode on for typos in note making md
