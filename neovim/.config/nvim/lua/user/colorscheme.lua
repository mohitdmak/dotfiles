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
vim.g.tokyonight_style               = "storm"
vim.g.tokyonight_transform_colors    = false
vim.g.tokyonight_italic_functions    = true
vim.g.tokyonight_italic_comments     = true
vim.g.italic_keywords                = true
vim.g.tokyonight_italic_variables    = false
vim.g.tokyonight_transparent         = true
vim.g.tokyonight_dark_float          = false
vim.g.tokyonight_dark_sidebar        = false
vim.g.hide_inactive_statusline       = true
vim.g.tokyonight_sidebars            = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_lualine_bold        = true
vim.g.tokyonight_terminal_colors     = true
vim.g.tokyonight_cterm_colors        = false

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { error = "#ff0000", border = "purple" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
-- 1) ENDS :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

-- 2) GRUVBOX MATERIAL THEME (RUSTY) :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-- vim.cmd[[
--     set background=dark
--     let g:gruvbox_material_sign_column_background = 'none' 
--     let g:gruvbox_material_background='hard'
--     let g:gruvbox_material_enable_bold = 1
--     let g:gruvbox_material_enable_italic = 1
--     let g:gruvbox_material_transparent_background = 0
--     let g:gruvbox_material_visual = 'reverse'
--     let g:gruvbox_material_current_word = 'bold'
--     let g:gruvbox_material_diagnostic_text_highlight = 0
--     let g:gruvbox_material_ui_contrast = 'high'
--     let g:gruvbox_material_diagnostic_line_highlight = 1
--     let g:gruvbox_material_diagnostic_virtual_text = 'colored'
--     let g:gruvbox_material_palette = 'mix'
--     let g:gruvbox_material_statusline_style = 'original'
-- 
--     colorscheme gruvbox-material
-- ]]
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
