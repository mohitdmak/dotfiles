#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAIL"
  echo "$*" 1>&2
  exit 1
}

# install vim plugs plugin manager
echo Installing Packer as Vim Plugin Manager . . .
# transitioning from vim-plug to packer for pure lua based neovim
if [ -d "$HOME/.local/share/nvim/site/pack" ]; then
    echo Already installed Packer, skipping . . .
else
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim || die "Could not install packer vim plugin manager."
fi

# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'\

# we need to download nvim app image from github.com/neovim/neovim, but we have saved a nightly v0.70 version of it in this repo itself
# thus add a step to download nvim.appimage from the official repo before this step if you want to get the latest version of neovim

# provide exec perms (app image must reside in home after stowing)
echo Setting up Nvim appimage . . .
cd $HOME && chmod u+x nightly_nvim.appimage && ./nightly_nvim.appimage || die "Could not execute app image."

echo Preparing squashfs-root and extracting appimage . . .
# execute app image, generate squashfs-root roo
./nightly_nvim.appimage --appimage-extract && ./squashfs-root/AppRun --version || die "Could not generate squashfs-root and extract from appimage."

echo Exposing nvim globally . . .
# expose nvim globally
if [ -d "/squashfs-root" ]; then
    echo Already Moved Squashfs-root
else
    sudo mv squashfs-root / && sudo ln -s /squashfs-root/AppRun /usr/bin/nvim || die "Could not expose nvim globally."
fi

echo Confirm Neovim Installation . . .
# check for proper nvim installation
nvim -v || die "NEOVIM is not installed properly."


# Assuming apt is installed
# Get ranger
echo Installing ranger explorer . . .
sudo apt install ranger || die "Could not install ranger."

# install lazygit
echo Installing Lazygit sc . . .
sudo add-apt-repository ppa:lazygit-team/release || die "Could not add ppa release to repo."
sudo apt-get update
sudo apt-get install lazygit || die "Could not install lazygit."
echo Confirming Lazygit installation . . .
lazygit --version || die "Lazygit was not installed properly."

# install lazydocker
# here too, the latest tar.gz from https://github.com/jesseduffield/lazydocker/releases is supposed to be used if you need the latest version
# else simply use the unpacked version provided in this repo as follows
echo Installing lazydocker container manager . . .
cd $HOME && sudo install lazydocker /usr/local/bin/ || die "Could not install lazydocker unpacked file."
echo Confirming Lazydocker installation . . .
lazydocker --version || die "Lazydocker was not installed properly."

# NOTE: Following blocks are redundant as we have shifted to nvim_lsp  
# # c/c++ family lsp support
# # Get clangd support
echo Obtaining C/C++ LSP support . . .
sudo apt-get install clangd-9 || die "Could not install clangd"
# make clangd-9 the default clangd
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100 || die "Clangd-9 could not be made the default clangd."
# verify installations
echo Confirming Clangd installation . . .
clangd --version || die "CLangd was not installed properly."

# Install node and npm support with build-essential
# We are using nvm as version manager for node/npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash || die "Could not install nvm."
# reloading nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm --version || die "NVM was not installed properly."
nvm install node || die "Could not install latest node using nvm."
nvm install 8.10.0 || die "Could not install prev version node using nvm."
nvm install --lts || die "Could not install lts version node using nvm."
node --version || die "Node was not installed properly."
npm --version || die "NPM was not installed properly."
# reloading nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install relevent node and py packages
# TODO ! sudo breaks npm global installation on aws ec2?
npm install -g neovim || die "Could not install neovim npm package."
echo Assuming you have Python3 installed . . .
sudo apt install python3-pip || die "Could not install pip manager."
pip3 install pynvim || die "Could not install pynvim."

# NOTE: Redundant configs : Lua does not require home locs
# editing home dir for init.vim 
# sed -i "s+/home/mohitdmak+$HOME+g" init.vim
# echo Note that you will need to install coc-clangd seperately in your neovim plugins as :CocInstall coc-clangd

# post installation note
echo SETUP COMPLETED.
echo Neovim successfully set up, now install plugins using :PackerSync
