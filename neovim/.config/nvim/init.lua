require "user.options"
require "user.keymaps"
-- require "user.indentline" -- TODO: to keep this or not?
require "user.plugins"
require "user.colorscheme"
-- require "user.neosolarized"
-- TEST WITH MASON?
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
-- FOR SOME REASON, importing this doesn't work, so pasting it's content here
-- require "user.new_nvim-tree"
-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--   return
-- end
-- local tree_cb = nvim_tree_config.nvim_tree_callback
require'nvim-tree'.setup {
    -- require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
      auto_reload_on_write = true,
      create_in_closed_folder = false,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      ignore_buffer_on_setup = false,
      open_on_setup = false,
      open_on_setup_file = false,
      open_on_tab = false,
      sort_by = "name",
      root_dirs = {},
      prefer_startup_root = false,
      sync_root_with_cwd = true,
      reload_on_bufenter = true,
      respect_buf_cwd = false,
      view = {
        adaptive_size = false, -- Resize the window on each draw based on the longest line.
        centralize_selection = false, -- when opening the sidebar, "zz" to current file location
        width = 40, -- width of sidebar
        height = 30, -- height of sidebar
        hide_root_folder = false, -- whether to hide top line denoting root location
        side = "right", -- sidebar location
        preserve_window_proportions = true, -- FIXME: whether to change windows' size for windows other than sidebar
        number = false, -- whether to print line no.s in sidebar
        relativenumber = false, -- same as above
        signcolumn = "yes", -- having a sign column
        -- mappings = { -- add your custom mappings here
        --   custom_only = false,
        --   list = {
        --     -- MY CUSTOM MAPPINGS
        --     -- R will refresh the tree
        --     -- <C-k> to view file info of time updated, created, etc
        --     -- f to run a life filter on listed files
        --     -- < / > to move between siblings of curr parent dir
        --     { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        --     { key = "h", cb = tree_cb "close_node" },
        --     { key = "i", cb = tree_cb "vsplit" },
        --     { key = "s", cb = tree_cb "split" },
        --     { key = "t", cb = tree_cb "tabnew" },
        --     { key = "p", cb = tree_cb "dir_up" },
        --     { key = "H", cb = tree_cb "parent_node" },
        --     { key = "u", cb = tree_cb "toggle_dotfiles" },
        --     { key = "U", cb = tree_cb "toggle_git_ignored" },
        --     { key = "L", cb = tree_cb "next_git_item" },
        --     { key = "K", cb = tree_cb "prev_git_item" },
        --     { key = "c", cb = tree_cb "copy_name" },
        --     { key = "C", cb = tree_cb "copy_absolute_path" },
        --   },
        -- },
      },
      renderer = {
        add_trailing = true, -- add trailing "/" to folders
        group_empty = true, -- group empty folders in one line node
        highlight_git = true, -- highlight name of files marked by git
        full_name = false, -- full name display for long file names
        highlight_opened_files = "icon", -- highlight open file's icons opts: none/icon/name/all
        root_folder_modifier = ":~", -- way to show root folder node
        indent_markers = { -- add indents in sidebar
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            item = "│ ",
            none = "  ",
          },
        }, -- above: config for indenting nvim tree
        icons = {
          webdev_colors = true, -- have icons coloured
          git_placement = "signcolumn", -- location of git icons wrt file name opts: before/after/signcolumn(needs view.signcolumn enabled)
          padding = " ", -- padding between icon and filename
          symlink_arrow = " ➛ ", -- symbol for symlinks
          show = { -- which icons to show
            file = true,
            folder = true,
            folder_arrow = true, -- requires indentation to be false
            git = true,
          }, -- above: config for icons to show
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "?",
              renamed = "➜",
              deleted = "",
              untracked = "✚",
              ignored = "",
              -- unstaged = "✗",
              -- staged = "✓",
              -- unmerged = "",
              -- renamed = "➜",
              -- untracked = "★",
              -- deleted = "",
              -- ignored = "◌",
            },
          },
        }, -- above: icon configs
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" }, -- special highlight for these files
        symlink_destination = true, -- whether to also show the destination of a symlinked file
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      ignore_ft_on_setup = {},
      system_open = {
        cmd = "",
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = { -- place to add custom filters
        dotfiles = false,
        custom = {},
        exclude = {},
      },
      filesystem_watchers = {
        enable = false,
        -- interval = 100,
        debounce_delay = 50,
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
        open_file = {
          quit_on_open = false, -- close sidebar on opening file
          resize_window = true, -- resize sidebar on opening file
          window_picker = { -- window picker when tiling windows
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = { -- close buffers of a file upon trashing from nvim tree
          close_window = true,
        },
      },
      trash = { -- configure commmand to be executed on trashing via nvim tree
        cmd = "gio trash",
        require_confirm = true,
      },
      live_filter = { -- configure live filtering
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },
      log = { -- configure logging
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
} -- END_DEFAULT_OPTS


-- RESUMING INIT.LUA after pasting nvim-tree contents
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
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
