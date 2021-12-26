# My NeoVim configuration

## NOTE : 
* "Plugged" directory containing git clones of repos of plugins is gitignored here due to large no of submodules. PlugInstall them seperately

## INSTALLATION :
* GIT CLONE THIS REPO UNDER ```$HOME/.config/```
* INSTALL THE PLUGIN MANAGER VIM-PLUG (DONT ESCAPE QUTOES WHILE PASTING CODE TO TERMINAL eg: \' to ' is to be done) : 
* ```sh -c \'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\' ``` 

### INSTALLING NEOVIM METHOD 1 :
* INSTALL NEOVIM BY USING LATEST RELEASE IMAGE (nvim.appimage): https://github.com/neovim/neovim/releases
* GENERATE SQUASHfs_ROOT DIR, MOVE IT TO ROOT DIR, MOVE APPIMAGE TO usr/bin/nvim
* ```./nvim.appimage --appimage-extract  ./squashfs-root/AppRun --version```
* Exposing nvim globally
``` mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim```
* INSTALLED, CHECK VERSION VIA ```nvim -v```.

### INSTALLING NEOVIM METHOD 2 :
* JUST USE THE APPIMAGE WHICH COMES ALONG WITH CLONED GH REPO (may not be latest, but works for me), and generate squashfsroot from there.

### INSTALL RANGER :
* YOU MAY NEED TO ADD THIS PLUGIN IN INIT.VIM to work : ```Plug 'rbgrouleff/bclose.vim'```
* INSTALL RANGER : ```sudo apt install ranger```

### INSTALL LAZYGIT :
* ```sudo add-apt-repository ppa:lazygit-team/release```
* ```sudo apt-get update```
* ```sudo apt-get install lazygit```

### INSTALL LAZYDOCKER :
* Download the latest .tar.gz file from https://github.com/jesseduffield/lazydocker/releases or use the provided one in this repo
* Unpack the downloaded file with the command ```tar xvzf lazydocker*.tar.gz ```
* Install with the command ```sudo install lazydocker /usr/local/bin/ ```

### C++/C FAMILY SUPPORT :
* Install clangd on deb/ubuntu by installing clangd-9 : ```sudo apt-get install clangd-9```
* Make clangd-9 the default clangd : ```sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100 ```
* Verify by ``` clangd --version ```
* You may need to install coc for it via ```:CocInstall coc-clangd ```
* In case of issues, follow https://github.com/clangd/coc-clangd

### POST INSTALLATION :
* nvim and apply :PlugInstall


This is the exact configuration I use to make NeoVim hella awesome for me to use.

Features:

-   Syntax
-   Sane keybindings
-   Pretty UI
-   Airline + Tabline
-   Pretty Start up screen
-   File explorer
-   FZF
-   Ranger
-   Floating Terminal
-   Autocomplete using Language servers
-   Autoformat on file save
-   Git integration
-   Spellcheck for markdown files
-   Bunch of plugins for functionality like vim-surround, vim-repeat, etc.
-   Silver Searcher to search through files

# Screenshots

![](img/nvim-five.png)
![](img/nvim-one.png)
![](img/nvim-two.png)
![](img/nvim-three.png)
![](img/nvim-four.png)
