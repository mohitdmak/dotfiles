#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAIL"
  echo "$*" 1>&2
  exit 1
}

# Assumes you have installed apt

# Install zsh
sudo apt install zsh
# test
zsh --version || die "Zsh is not installed properly."

# make zsh as default shell
# (also assumes you have sudo access)
chsh -s $(which zsh) || die "Issue in making zsh as default shell, do you have sudo access ?"
# check default shell
$SHELL --version || die "Zsh could not be made as default shell."

# check if script had a run earlier for installing ohmyzsh
if [ $ZSH = "$HOME/.oh-my-zsh" ]; then
    echo "Oh-my-zsh is already installed, skipping installation steps . . ."
else
    # install oh my zsh
    # NOTE: We directly "stow" custom .ohmyzsh containing all custom plugins
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || die "Oh  my zsh could not be installed."
    # Thus, run the ohmyzsh installer script directly
    cd $HOME && bash ./.ohmyzsh/tools/install.sh 
fi

# NOTE: Redundant, powerlevel9k git repo already supplied via custom .ohmyzsh repo
# # check if script had a run earlier for installing powerline fonts
# if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
#     echo "Powerline fonts have already been installed, skipping installation steps . . ."
# else 
#     # install powerline fonts
#     git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k || die "Powerline fonts git repo could not be cloned into .ohmyzsh"
# fi

# NOTE: Redundant, stow .zshrc instead
# get custom zsh configuration
# sudo cp .zshrc $HOME/.newzshrc || die "Could not copy custom zsh profile to current home."
# # replace default zsh config
# cd $HOME
# sudo mv .zshrc .oldzshrc || die "Cannot remove old zsh profile."
# sudo mv .newzshrc .zshrc || die "Cannot set new zsh profile."

# change home to current user's
sudo sed -i "s+/home/mohitdmak+$HOME+g" .zshrc || die "Cannot edit new zsh profile for current home replacement"

echo "INSTALLATION COMPLETE, RELOAD SHELL OR EXIT AND SSH AGAIN."
