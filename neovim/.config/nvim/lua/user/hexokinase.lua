vim.cmd[[
    " Neovim default
    let g:Hexokinase_highlighters = [ 'virtual', 'sign_column' ]




    " Patterns to match for all filetypes
    " Can be a comma separated string or a list of strings
    " Default value:
    let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

    " All possible values
    let g:Hexokinase_optInPatterns = [
    \     'full_hex',
    \     'triple_hex',
    \     'rgb',
    \     'rgba',
    \     'hsl',
    \     'hsla',
    \     'colour_names'
    \ ]

    " Filetype specific patterns to match
    " entry value must be comma seperated list
    let g:Hexokinase_ftOptInPatterns = {
    \     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
    \     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
    \ }


]]

-- " All possible highlighters
    -- let g:Hexokinase_highlighters = [
    -- \   'virtual',
    -- \   'sign_column',
    -- \   'background',
    -- \   'backgroundfull',
    -- \   'foreground',
    -- \   'foregroundfull'
    -- \ ]

-- " Vim default
-- let g:Hexokinase_highlighters = [ 'sign_column' ]
-- " Sample value, to keep default behaviour don't define this variable

-- let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
