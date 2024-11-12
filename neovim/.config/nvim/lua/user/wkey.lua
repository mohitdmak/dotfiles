local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

---@class wk.Opts
local defaults = {
  ---@type false | "classic" | "modern" | "helix"
  preset = "classic",
  -- Delay before showing the popup. Can be a number or a function that returns a number.
  ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  ---@param mapping wk.Mapping
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  --- You can add any mappings here, or use `require('which-key').add()` later

  ---@type wk.Spec
  spec = {

    { "<leader>", "<leader>a", desc = "<cmd>Startify<cr>", nowait = true, remap = false },
    },
  -- show a warning when issues were detected with your mappings
  notify = true,
  -- Which-key automatically sets up triggers for your mappings.
  -- But you can disable this and setup the triggers manually.
  -- Check the docs for more info.
  ---@type wk.Spec
  triggers = {
    { "<auto>", mode = "nxsot" },
  },
  -- Start hidden and wait for a key to be pressed before showing the popup
  -- Only used by enabled xo mapping modes.
  ---@param ctx { mode: string, operator: string }
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  ---@type wk.Win.opts
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    width = { min = 20 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  ---@type (string|wk.Sorter)[]
  --- Mappings are sorted using configured sorters and natural sort of the keys
  --- Available sorters:
  --- * local: buffer-local mappings first
  --- * order: order of the items (Used by plugins like marks / registers)
  --- * group: groups last
  --- * alphanum: alpha-numerical first
  --- * mod: special modifier keys last
  --- * manual: the order the mappings were added
  --- * case: lower-case first
  sort = { "local", "order", "group", "alphanum", "mod" },
  ---@type number|fun(node: wk.Node):boolean?
  expand = 0, -- expand groups when <= n mappings
  -- expand = function(node)
  --   return not node.desc -- expand all nodes without a description
  -- end,
  -- Functions/Lua Patterns for formatting the labels
  ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
      -- { "<Space>", "SPC" },
    },
    desc = {
      { "<Plug>%(?(.*)%)?", "%1" },
      { "^%+", "" },
      { "<[cC]md>", "" },
      { "<[cC][rR]>", "" },
      { "<[sS]ilent>", "" },
      { "^lua%s+", "" },
      { "^call%s+", "" },
      { "^:%s*", "" },
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    -- set to false to disable all mapping icons,
    -- both those explicitely added in a mapping
    -- and those from rules
    mappings = true,
    --- See `lua/which-key/icons.lua` for more details
    --- Set to `false` to disable keymap icons from rules
    ---@type wk.IconRule[]|false
    rules = {},
    -- use the highlights from mini.icons
    -- When `false`, it will use `WhichKeyIcon` instead
    colors = true,
    -- used by key format
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  -- disable WhichKey for certain buf types and file types.
  disable = {
    ft = {},
    bt = {},
  },
  debug = false, -- enable wk.log in the current directory
}

which_key.setup(setup)
-- which_key.register(mappings, opts)
-- local mappings ={
--     { "<leader>", "<leader>ta", desc = ":TodoTelescope<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>lk", desc = "<cmd>lua vim.diagnostic.goto_prev()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>lj", desc = "<cmd>lua vim.diagnostic.goto_next()<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>li", desc = "<cmd>LspInfo<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>ll", desc = "<cmd>lua vim.lsp.codelens.run()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>lr", desc = "<cmd>lua vim.lsp.buf.rename()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>lq", desc = "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>ls", desc = "<cmd>Telescope lsp_document_symbols<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>lf", desc = "<cmd>lua vim.lsp.buf.format()<cr> :%s/\r//g<CR> ", nowait = true, remap = false },
--     { "<leader>", "<leader>la", desc = "<cmd>lua vim.lsp.buf.code_action()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>k", desc = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>j", desc = "<cmd>lua require 'gitsigns'.next_hunk()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>ld", desc = "<cmd>Telescope diagnostics bufnr=0<cr>", nowait = true, remap = false },
--     { "<leader>", group = "LSP", nowait = true, remap = false },
--     { "<leader>", "<leader>lS", desc = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>lI", desc = ":Mason<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>go", desc = "<cmd>Telescope git_status<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>lw", desc = "<cmd>Telescope diagnostics<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>pS", desc = "<cmd>PackerStatus<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sc", desc = "<cmd>Telescope colorscheme<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sb", desc = "<cmd>Telescope git_branches<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sR", desc = "<cmd>Telescope registers<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sh", desc = "<cmd>Telescope help_tags<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sr", desc = "<cmd>Telescope oldfiles<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sk", desc = "<cmd>Telescope keymaps<cr>", nowait = true, remap = false },
--     { "<leader>", group = "Packer", nowait = true, remap = false },
--     { "<leader>", "<leader>sM", desc = "<cmd>Telescope man_pages<cr>", nowait = true, remap = false },
--     { "<leader>", group = "Search", nowait = true, remap = false },
--     { "<leader>", "<leader>pi", desc = "<cmd>PackerInstall<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>pc", desc = "<cmd>PackerCompile<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>sC", desc = "<cmd>Telescope command_history<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>ps", desc = "<cmd>PackerSync<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>r", desc = "<cmd>lua _RANGER_TOGGLE()<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>pu", desc = "<cmd>PackerUpdate<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>ss", desc = "<cmd>Telescope search_history<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>gl", desc = "<cmd>lua require 'gitsigns'.blame_line()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>gc", desc = "<cmd>Telescope git_commits<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>yy", desc = ":VimwikiMakeYesterdayDiaryNote<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>yt", desc = ":VimwikiMakeTomorrowDiaryNote<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>yn", desc = ":VimwikiMakeDiaryNote<cr>", nowait = true, remap = false },
--     { "<leader>", group = "Screen Cleaner", nowait = true, remap = false },
--     { "<leader>", "<leader>zL", desc = ":lua vim.diagnostic.enable()<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>zG", desc = ":Gitsigns toggle_numhl<CR> :Gitsigns toggle_signs<CR> :set signcolumn=yes<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>zS", desc = ":set laststatus=2<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>yi", desc = ":VimwikiDiaryIndex<cr>", nowait = true, remap = false },
--     { "<leader>", group = "WikiLogs", nowait = true, remap = false },
--     { "<leader>", "<leader>tm", desc = ":TodoTelescope keywords=MOHITDMAK<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>tf", desc = ":TodoTelescope keywords=FIXME<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>yg", desc = ":VimwikiDiaryGenerateLinks<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>tn", desc = ":TodoTelescope keywords=NOTE<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>u", desc = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR> :sleep 1<CR> :NvimTreeRefresh<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>tt", desc = ":TodoTelescope keywords=TODO<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>gd", desc = "<cmd>Gitsigns diffthis HEAD<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>zg", desc = ":Gitsigns toggle_numhl<CR> :Gitsigns toggle_signs<CR> :set signcolumn=no<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>zl", desc = ":lua vim.diagnostic.disable()<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>f", desc = "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>e", desc = "<Plug>VimwikiUISelect", nowait = true, remap = false },
--     { "<leader>", "<leader>d", desc = "<cmd>Telescope buffers<cr>", nowait = true, remap = false },
--     { "<leader>", group = "Git", nowait = true, remap = false },
--     { "<leader>", "<leader>gb", desc = "<cmd>Telescope git_branches<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>gR", desc = "<cmd>lua require 'gitsigns'.reset_buffer()<CR> :sleep 1<CR> :NvimTreeRefresh<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>zi", desc = ":IndentBlanklineToggle<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>a", desc = "<cmd>Startify<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>K", desc = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>zs", desc = ":set noruler<CR> :set laststatus=0 :set cmdheight=0<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>U", desc = "<cmd>lua require 'gitsigns'.reset_hunk()<CR> :sleep 1<CR> :NvimTreeRefresh<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>F", desc = "<cmd>Telescope live_grep theme=ivy<cr>", nowait = true, remap = false },
--     { "<leader>", "<leader>J", desc = "<cmd>lua require 'gitsigns'.stage_hunk()<CR> :sleep 1<CR> :NvimTreeRefresh<CR>", nowait = true, remap = false },
--     { "<leader>", "<leader>G", desc = "<cmd>lua _LAZYGIT_TOGGLE()<CR> :NvimTreeRefresh<CR>", nowait = true, remap = false },
--     { "<leader>", group = "Dev Hunks", nowait = true, remap = false },
--   } 

