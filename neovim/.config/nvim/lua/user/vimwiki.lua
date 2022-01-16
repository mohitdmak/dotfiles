 -- Here we set list of our vim wiki dirs/dbs
vim.g["vimwiki_list"] = {
    {
      path = '~/dotfiles', path_html = '~/dotfiles/html', syntax = 'markdown', ext = '.md', template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/"
    },
    {
      path = '~/Semester::2:2', path_html = '~/Semester::2:2/html', syntax = 'markdown', ext = '.md', template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/"
    },
    {
      path = '~/vimwiki', path_html = '~/vimwiki/html', syntax = 'markdown', ext = '.md', template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/"
    }
  }
vim.g["vimwiki_global_ext"] = 0


-- VIMWIKI CUSTOM BINDINGS
vim.cmd([[ autocmd filetype vimwiki nmap <C-j> <Plug>VimwikiSplitLink <ESC> ]])
vim.cmd([[ autocmd filetype vimwiki nmap <C-k> <Plug>VimwikiVSplitLink <ESC> ]])
vim.cmd([[ autocmd filetype vimwiki nmap <C-t> <Plug>VimwikiTabnewLink <ESC> ]])
-- vim.cmd([[ autocmd filetype vimwiki nmap <C-n> <Plug>VimikiListChangeSymbolI * ]])
vim.cmd([[ autocmd filetype vimwiki nnoremap n :lnext <CR> ]])
vim.cmd([[ autocmd filetype vimwiki nnoremap N :lprevious <CR> ]])
vim.cmd([[ autocmd filetype vimwiki nnoremap <C-n> :lopen <CR> ]])
vim.cmd([[ autocmd filetype vimwiki nmap <leader>d <Plug>VimwikiToggleListItem <ESC> ]])
-- vim.cmd([[ autocmd filetype vimwiki nmap <leader>D <Plug>VimwikiToggleRejectedListItem <ESC> ]])
-- vim.cmd([[ autocmd filetype vimwiki nmap <leader>n <Plug>VimwikiIncrementListItem <ESC> ]])
-- vim.cmd([[ autocmd filetype vimwiki nmap <leader>N <Plug>VimwikiDecrementListItem <ESC> ]])
-- let g:vimwiki_listsyms = '✗○◐●✓'
-- Toggle item of checkbox list? & all checkbox related plug commands starting :450
-- Move current table column to left or right?
-- TODO: VIM WIKI ORGANIZE
