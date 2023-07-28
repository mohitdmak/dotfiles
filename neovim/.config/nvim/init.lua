require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
-- require "user.neosolarized"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.hexokinase"
--require "user.comment"
require "user.comments"
require "user.gitsigns"
require "user.todocomments"
-- require "user.nvim-tree"
require "user.new_nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
-- require "user.alpha"
require "user.startify"
require "user.whichkey"
require "user.vimwiki"
require "user.autocommands"

-- for mac - nvimux
-- require "user.nvimux"

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here

    -- set font, size
    vim.o.guifont = "Hack Nerd Font:h14" -- text below applies for VimScript

	-- Allow clipboard copy paste in neovim
	vim.g.neovide_input_use_logo = 1
	vim.api.nvim_set_keymap('i', '<D-v>', '+p<CR>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
	-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

	-- Adjust transparency
	-- vim.g.neovide_transparency = 0.0
	-- vim.g.transparency = 0.8
	-- Helper function for transparency formatting
	local alpha = function()
	  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.95
	vim.g.neovide_background_color = "#0f1117" .. alpha()
	-- Adjust blur
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	-- hide mouse while typing
	vim.g.neovide_hide_mouse_when_typing = true

	-- set animation duration for scroll 
	vim.g.neovide_scroll_animation_length = 0.1

    -- remember previous window size
    vim.g.neovide_remember_window_size = true

    -- cursor animation duration/trail size
    vim.g.neovide_cursor_animation_length = 0.01
    vim.g.neovide_cursor_trail_size = 0.4

end
