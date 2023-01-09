# Dotfiles


## Vim 
* [New bindings](vim_learnings)

## Reminders for new machines
* [X] Remember to set "filter_ignored" property of function M.setup(opts) in ~/.local/share/nvim/site/pack/packer/start/nvim-tree.lua/lua/nvim-tree/populate.lua to false
* [ ] Remind nvm bt solved by writing export 3lines tozshrc orbashrc
* [X] Remind stow ignore list
* [X] Ryanoasis nerdfonts repo
* [ ] Keybindings for insert mode?
* [ ] setup obsidian sync between linux and android - https://werzum.github.io/tech/2022/02/13/Obsidian-Mobile-Sync.html (termux and termux widget usage)
* [ ] NOTE: For obsidian/other desktop apps integration with rofi see answer by *"notachraf"* here - https://unix.stackexchange.com/questions/364773/how-to-get-installed-application-to-be-detected-by-rofi
* [X] specific version of picom fork required, see its stow folder
* [X] tokyonight package modifications? - placed the whole site package in dotfiles, directly use it in ~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/
* [X] super neovim/vim collection for reference - https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#ceef
* [X] NOTEEE: ":e" reloads buffer, used to syntax highlight fenced code by language in vimwiki
* [X] Works for Keychron K3. I presume K2 has the same hotkeys.
disable auto sleep: fn+s+l+o
Auto sleep in 10mins: Press fn+s+l+r for four seconds
Auto sleep in 20mins: Press fn+s+l+t for four seconds
Auto sleep in 30mins: Press fn+s+l+y for four seconds

## Todo
* [X] TODO: REMOVE BOTTOM LUALINE -- NEVER REALLY USE IT
* [ ] bell in alacritty
* [ ] tmux/alacritty vim nav
* [X] Battery low warning more verbal
* [X] keychron k2 extend sleep timeout
* [X] nvim startify add systemd config page and batterypopup
* [ ] maybe replace current to use mason.nvim later
* [ ] lazy.nvim?
* [ ] wine configs - picom, fonts, etc
* [X] fingerprint reader for sudo/etc?
    * [ ] TOO risky, for corruption due to 2 drivers from windows/linux
* [ ] screen blackout / saver timeout configurable?
* [ ] lookup tmux/zsh vim keybindings 
* [ ] tokyonight border on float term
* [ ] script run from i3.config to start all custom --user services on startup
* [ ] rofi bluetooth and network
* [ ] Stream mobile notififications on linux
* [ ] Way to save tmux sessions locally periodically  (maybe even on cloud)
* [ ] browser open ranger for file upload download
* [X] systemd service to keep gh repos for dotfiles/local settings updated periodically
* [X] obstidian hack for above
* [X] Try out later: https://www.reddit.com/r/vim/comments/s1f14h/the_vimium_extension_for_chrome_is_amazing/
* [ ] Try out later: https://vim.fandom.com/wiki/Browsing_programs_with_tags
* [X] <leader>z reversal
* [X] indent lines plus reversal
* [ ] Fix vim conceal for colorized tags in vimwiki
* [ ] Fix: visual and normal mode to switch bw '', "", (), {}, [], <>
* [ ] Nvim tree current dir doesnt set, causing further problems in telescope file and text search
* [X] Remove line numberings in situations where its not needed
* [X] Battery low indicator (more verbal)
* [ ] `set lazydraw` for improved macro performance?
* [ ] n & N mappings for VWS interfere with that of normal search
* [X] Default app for pdf/png alacritty - feh
* [ ] Installer scripts
    - [ ] Nvim
    - [ ] Zsh
    - [ ] Misc
    - [ ] I3
    - [ ] etc
* [X] Nvim-tree doesnt copy to clipboard
* [X] Vim wiki setup
    - [X] Table bindings?
    - [X] etc
* [ ] LSP doesnt asynchronously check for each file in background, only the ones open.
* [ ] Spell as nvim-cmp source for lsp
* [ ] Map <leader>H/L, unused
* [X] Map <leader>H/L, unused, window move left/right, switch bw horizontal and vertical layout. - not really neeeded
* [ ] Started using ultisnips, but removing luasnips causes cmp to die altogether?
* [ ] Lookup /usr/share/doc/ranger

