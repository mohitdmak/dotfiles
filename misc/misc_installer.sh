#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAIL"
  echo "$*" 1>&2
  exit 1
}

# Install fzf
sh -c"git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install"
    || die Unable to install fzf

# Install htop
sudo apt install htop || die Apt couldnt install htop
htop --version || die Htop not installed properly

# Install bat
sudo apt install bat || die Apt couldnt install bat
mkdir -p ~/.local/bin || die Permissions error during bat installation
# Create symlinks between bat and batcat in order to avoid duplicate aliases 
ln -s /usr/bin/batcat ~/.local/bin/bat || die Couldnt create symlink between bat and batcat symlinks 

# NOTE: Other Miscs such as lazydocker, lazygit are installed along with vim in nvim_installer.sh
