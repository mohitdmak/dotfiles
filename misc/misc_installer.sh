#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAIL"
  echo "$*" 1>&2
  exit 1
}

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || die Unable to install fzf, is git installed ?
~/.fzf/install || die Unable to run installation script for fzf

# Install htop
sudo apt install htop || die Apt couldnt install htop
htop --version || die Htop not installed properly

# Install bat
sudo apt install bat || die Apt couldnt install bat (batcat)
mkdir -p ~/.local/bin || die Unable to create .local dir for symlinking batcat to bat
# Create symlinks between bat and batcat in order to avoid duplicate aliases 
if [[ -f "$HOME/.local/bin/bat" ]]; then
    echo Already created symlink between batcat and bat, skipping . . .
else
    # NOTE: Our zsh rc would add the $HOME/.local/bin to $PATH, so that we would not need to modify it in every new session
    ln -s /usr/bin/batcat ~/.local/bin/bat || die Unable to create symlink between bat and batcat symlinks 
fi

# NOTE: Other Miscs such as lazydocker, lazygit are installed along with vim in nvim_installer.sh
