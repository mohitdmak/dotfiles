local opts = { noremap = true, silent = true }

local term_opts = { silent = true }


-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- FILE SPECIFIC KEYMAPS ---------------------------------------------------------
-- Working with cpp files and dsa setup
-- Hotkey to save the file, compile and run it against ainput and aoutput txt files, modify results to corresponding files, send error logs to log txt file in repo.
vim.cmd([[
autocmd filetype cpp nnoremap <silent> <leader>b :w <bar> !g++ % -fsanitize=address 2>my/cpp/log.txt -o %:r && timeout -k9 -v 1 %:r < my/cpp/input.txt > my/cpp/output.txt 2>my/cpp/log.txt && rm %:r<CR><CR>
]])
-- FOR LEETCODING (PYTHON3)
vim.cmd([[
autocmd filetype python nnoremap <silent> <leader>b :w<CR> :!timeout -k9 -v 1 python3 % < my/py/input.txt > my/py/output.txt 2>my/py/log.txt<CR><CR>
]])
-- FOR CODEFORCES (PYPY2)
-- vim.cmd([[
-- autocmd filetype python nnoremap <silent> <leader>b :w<CR> :!timeout -k9 -v 1 pypy % < my/py/input.txt > my/py/output.txt 2>my/py/log.txt<CR><CR>
-- ]])
vim.cmd([[
autocmd filetype java nnoremap <silent> <leader>b :w <bar> !timeout -k9 -v 1 javac % 2>OOPS/javaEnv/cases/log.txt && cd OOPS/javaEnv/cases && timeout -k9 -v 1 java %:t:r < ainput.txt > aoutput.txt 2>log.txt && timeout -k9 -v 1 rm *.class<CR><CR>
]])
-- vim.cmd([[
-- autocmd filetype java nnoremap <silent> <leader>b :w <bar> !timeout -k9 -v 1 javac % 2>OOPS/javaEnv/cases/log.txt && cd OOPS/javaEnv/cases && timeout -k9 -v 1 java %:t:r < ainput.txt > aoutput.txt 2>log.txt && timeout -k9 -v 1 rm %:t:r.class<CR><CR>
-- ]])
-- -- same function as above, but for c files
-- vim.cmd([[
-- autocmd filetype c nnoremap <silent> <leader>b :w <bar> !timeout -k9 -v 1 gcc % 2>c/log.txt -o %:r && timeout -k9 -v 1 ./%:r < c/ainput.txt > c/aoutput.txt 2>c/log.txt && timeout -k9 -v 1 rm %:r<CR><CR>
-- ]])
-- Hotkey to toggle Git signs and highlights while using cpp files (really not needed there)
-- vim.cmd([[autocmd filetype * nnoremap <silent> <leader>B :Gitsigns toggle_numhl<CR> :Gitsigns toggle_signs<CR>]])
-- Temporary need: translate ts to js files upon saving
-- vim.cmd([[autocmd BufWritePost *.ts !tsc %]])

-- VIMWIKI CUSTOM BINDINGS
-- TODO: Vimwiki bindings @ "./vimwiki.lua"

-- UTILITY KEYMAPS ---------------------------------------------------------------
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Lite ZENMODE --
-- keymap("n", "<leader>z", ":set noruler<CR> :set laststatus=0<CR>", opts)

-- Normal --
-- Better Line navigation
keymap("n", "<S-h>", "^", opts)
keymap("n", "<S-l>", "$", opts)
-- Reverse undo
keymap("n", "U", "<C-R>", opts)
-- noh (no highlight)
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Differentiating between cut and delete?

-- Better window navigation
keymap("n", "<C-_>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-X>", ":cd %:p:h<cr>:pwd<cr>", opts) -- reset nvim-tree root
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<CR>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<M-S-j>", "<C-w>J", opts)
-- keymap("n", "<M-S-k>", "<C-w>K", opts)

-- Better Tab navigation
keymap("n", "<Tab>", ":tabn<CR>", opts)
keymap("n", "<S-Tab>", ":tabp<CR>", opts)
keymap("n", "<leader>1", "1gt<CR>", opts)
keymap("n", "<leader>2", "2gt<CR>", opts)
keymap("n", "<leader>3", "3gt<CR>", opts)
keymap("n", "<leader>4", "4gt<CR>", opts)
keymap("n", "<leader>5", "5gt<CR>", opts)
keymap("n", "<leader>6", "6gt<CR>", opts)
keymap("n", "<leader>7", "7gt<CR>", opts)
keymap("n", "<leader>8", "8gt<CR>", opts)
keymap("n", "<leader>9", "9gt<CR>", opts)
keymap("n", "<leader><Tab>", "g<tab><CR>", opts)
-- keymap("n", "<M-Tab>", "gt<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<M-b>", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n", "<C-t>", "<ESC><CMD>ToggleTerm size=14 direction=horizontal<CR>", opts)
keymap("n", "<C-y>", "<cmd>w! <CR> :NvimTreeRefresh<CR>", opts)
keymap("n", "<C-d>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-b>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-c>", ":b#<CR>", opts)
-- keymap("n", "<M-C-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<C-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<C-e>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<C-f>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<C-g>", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<C-m>", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<C-n>", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<C-o>", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<C-p>", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<C-s>", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<C-t>", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<C-u>", ":BufferLineGoToBuffer 8<CR>", opts)
-- keymap("n", "<C-y>", ":BufferLineGoToBuffer 9<CR>", opts) -- C-y used in cmd-w saving ball
-- NOTE: ctrl + i is mostly free
-- g m n o p s t u y

-- Move text up and down
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- to move cursor ahead of brackets and quotes
keymap("i", "kj", "<right>", opts)
-- map <M-v> "+p<CR>
-- keymap("i", "<M-v>", '"+p<CR>', opts)

-- toggle fullscreen
keymap("n", "<M-f>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", opts)
-- vim.api.nvim_set_keymap('n', '<M-f>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<CR>')

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Better Line navigation
keymap("v", "<S-h>", "^", opts)
keymap("v", "<S-l>", "$", opts)
keymap("v", "as", "<ESC>", opts)
-- Tabular commands
keymap("v", "T:", ":Tab /:<CR>", opts)
keymap("v", "T::", ":Tab /::<CR>", opts)
keymap("v", "T=", ":Tab /=<CR>", opts)
keymap("v", "T,", ":Tab /,<CR>", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
--keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "jk", "<ESC>", term_opts);
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--vim.cmd([[unmap i Tab]])
keymap("i", "asd", ":UltiSnips#ExpandSnippet()", opts)
