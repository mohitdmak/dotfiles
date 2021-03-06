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
autocmd filetype cpp nnoremap <silent> <leader>b :w <bar> !timeout -k9 -v 1 g++ % -fsanitize=address 2>cpp/log.txt -o %:r && timeout -k9 -v 1 ./%:r < cpp/ainput.txt > cpp/aoutput.txt 2>cpp/log.txt && timeout -k9 -v 1 rm %:r<CR><CR>
]])
vim.cmd([[
autocmd filetype python nnoremap <silent> <leader>b :w<CR> :!timeout -k9 -v 1 python3 % < my/py/input.txt > my/py/output.txt 2>my/py/log.txt<CR><CR>
]])
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
keymap("n", "<A-e>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
-- keymap("n", "<A-S-j>", "<C-w>J", opts)
-- keymap("n", "<A-S-k>", "<C-w>K", opts)

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
keymap("n", "<A-b>", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n", "<A-t>", "<ESC><CMD>ToggleTerm size=14 direction=horizontal<CR>", opts)
keymap("n", "<A-w>", "<cmd>w! <CR> :NvimTreeRefresh<CR>", opts)
keymap("n", "<A-C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-C-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<A-C-j>", ":b#<CR>", opts)
keymap("n", "<A-C-q>", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<A-H>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<A-L>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opts)

-- Move text up and down
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
-- to move cursor ahead of brackets and quotes
keymap("i", "kj", "<right>", opts)

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
