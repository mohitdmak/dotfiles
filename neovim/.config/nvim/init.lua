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

-- NEOVIDE CONFIGS
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    -- vim.o.guifont = "FONT, FONT Backup 1, FONT Backup2:option1:option2:option3" -- text below applies for VimScript
    vim.o.guifont = "JetBrains Mono:h9" -- text below applies for VimScript
    vim.opt.linespace = 0
    vim.g.neovide_scale_factor = 1.0

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- background/transparency skipped

    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_transparency = 0.9

    vim.g.neovide_scroll_animation_length = 0.3
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5

    vim.g.neovide_no_idle = false
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_fullscreen = true
    vim.g.neovide_remember_window_size = true

    vim.g.neovide_profiler = false
end
