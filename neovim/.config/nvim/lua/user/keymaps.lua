local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

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
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n", "<leader>t", "<ESC><CMD>ToggleTerm size=14 direction=horizontal<CR>", opts)
keymap("n", "<leader>w", "<cmd>w!<CR>", opts)
keymap("n", "<A-S-l>", ":bnext<CR>", opts)
keymap("n", "<A-S-h>", ":bprevious<CR>", opts)
keymap("n", "<A-S-j>", ":b#<CR>", opts)
keymap("n", "<A-S-k>", "<cmd>Bdelete!<CR>", opts)

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

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
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

