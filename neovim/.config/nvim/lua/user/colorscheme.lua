-- SAFE LOADING OF COLORSCHEME (IN CASE PLUGIN MANAGER DOES NOT HAVE IT INSTALLED ALREADY)
-- vim.cmd [[
-- try
--   colorscheme falcon
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- 1) TOKYONIGHT SCHEME (MAINSTAY) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- MY STANDARD THEME
-- vim.g.tokyonight_style               = "storm"
-- vim.g.tokyonight_transform_colors    = false
-- vim.g.tokyonight_italic_functions    = true
-- vim.g.tokyonight_italic_comments     = true
-- vim.g.italic_keywords                = true
-- vim.g.tokyonight_italic_variables    = false
-- vim.g.tokyonight_transparent         = true
-- vim.g.tokyonight_dark_float          = true
-- vim.g.tokyonight_dark_sidebar        = true
-- vim.g.hide_inactive_statusline       = true
-- vim.g.tokyonight_sidebars            = { "qf", "vista_kind", "terminal", "packer", "toggleterm" }
-- vim.g.tokyonight_transparent_sidebar = false
-- vim.g.tokyonight_lualine_bold        = true
-- vim.g.tokyonight_terminal_colors     = true
-- vim.g.tokyonight_cterm_colors        = false
--
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { error = "#ff0000", border = "purple" }

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "normal", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

-- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight]]

-- 1) ENDS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- 2) GRUVBOX MATERIAL THEME (RUSTY) :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- TODO: GITSIGNS VERY BRIGHT HERE!
vim.cmd[[
    set background=dark
    let g:gruvbox_material_palette = 'material'
    let g:gruvbox_material_foreground = 'material'
    let g:gruvbox_material_background ='medium'
    let g:gruvbox_material_transparent_background = 2
    let g:gruvbox_material_better_performance = 1
    let g:gruvbox_material_dim_inactive_windows = 1
    let g:gruvbox_material_visual = 'reverse'
    let g:gruvbox_material_sign_column_background = 'none' 
    let g:gruvbox_material_ui_contrast = 'low'
    let g:gruvbox_material_diagnostic_text_highlight = 1
    let g:gruvbox_material_diagnostic_line_highlight = 1
    let g:gruvbox_material_enable_bold = 1
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_current_word = 'bold'
    let g:gruvbox_material_diagnostic_virtual_text = 'colored'

    let g:gruvbox_material_statusline_style = 'material'

    colorscheme gruvbox-material
]]
-- let g:gruvbox_material_palette = 'original' or 'material' or 'mix'
-- let g:gruvbox_material_statusline_style = 'original' or 'default' or 'mix' (see readme)
-- let g:gruvbox_material_lightline_disable_bold = 1
-- let g:gruvbox_material_current_word = 'bold' or 'underline' or 'italic' or 'grey background' (highlights the current word under cursor)
-- let g:gruvbox_material_sign_column_background = 'none' or 'default', latter lets the sign column have different color than the rest background
-- Available values: `'grey background'`, `'green background'`,
-- `'blue background'`, `'red background'`, `'reverse'`
-- Default value: `'grey background'`
-- 2) ENDS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- 3) MATERIAL THEME :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- vim.cmd([[
-- let g:material_theme_style = 'ocean'
-- colorscheme material
-- ]])
-- 2) ENDS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
