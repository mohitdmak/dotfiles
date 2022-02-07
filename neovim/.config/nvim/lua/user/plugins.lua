local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  --  General use plugins, used by most other plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Utility Plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  --use "numToStr/Comment.nvim" -- Easily comment stuff
  use "terrortylor/nvim-comment" -- easy commenting
  use "kyazdani42/nvim-web-devicons" -- devicon icons for nvim-tree
  use "kyazdani42/nvim-tree.lua" -- file tree manager
  use "akinsho/bufferline.nvim" -- bufferline for display
  use "moll/vim-bbye" -- proper buffer closing without messing up current window
  use "nvim-lualine/lualine.nvim" -- quick status line in lua
  use "akinsho/toggleterm.nvim" -- floating terminal manager
  use "ahmedkhalf/project.nvim" -- project finder (based on .git dirs probably)
  use "lewis6991/impatient.nvim" -- speeds up neovim loading by using an efficient execution of "require" in lua
  -- use "goolord/alpha-nvim" -- startup dashboard (currently use startify instead)
  use "mhinz/vim-startify" -- vim startify, dashboard manager for bookmarks, settings, mru, history, etc
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim" -- helpful keybindings guider
  use "godlygeek/tabular" -- helpful syntactical sugar
  use "JoosepAlviste/nvim-ts-context-commentstring" -- helps to mark comment strings for commenting binding
  use "tpope/vim-surround" -- 

  -- Colorschemes (Removed all default ones, trying out only custom gh cloned colorshemes)
  use "lunarvim/colorschemes" 
  use "lunarvim/darkplus.nvim"
  use "lunarvim/onedarker.nvim"
  use "folke/tokyonight.nvim" -- main go-to theme
  use "rmehri01/onenord.nvim"
  use "mhartington/ oceanic-next"
  use "EdenEast/nightfox.nvim"
  use "rose-pine/neovim"
  use "sainnhe/everforest"
  use "shaunsingh/moonlight.nvim"
  use "shaunsingh/nord.nvim"
  use "kyazdani42/blue-moon"
  use "marko-cerovac/material.nvim"
  use "rafamadriz/neon"
  use "glepnir/zephyr-nvim"
  use "fenetikm/falcon"
  use "arcticicestudio/nord-vim"
  use "sainnhe/gruvbox-material"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "SirVer/ultisnips" -- custom snippet completions
  use "quangnguyen30192/cmp-nvim-ultisnips" -- cmp integratable for utlitsnip
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp support 

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --vimwiki
  use { "vimwiki/vimwiki", branch = "dev" }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- heavily used finder menu
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter", -- syntax highlighting support
    run = ":TSUpdate",
  }
  -- use "norcalli/nvim-colorizer.lua"
  use {
    'RRethy/vim-hexokinase',
    run = 'cd ~/.local/share/nvim/site/pack/packer/opt/vim-hexokinase && make hexokinase',
    cmd = {"HexokinaseToggle"},
  }

  -- Git
  use "lewis6991/gitsigns.nvim" -- git sign support near line number

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
