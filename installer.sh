#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAIL"
  echo "$*" 1>&2
  exit 1
}

# Install stow
sudo apt install stow || die Error installing stow

# Stow all programs and modules
sudo stow * || die Error in running GNU Stow to create symlinks among configuration files

# Install miscalleneous programs
sudo bash ./misc/misc_installer.sh || die Error running Misc Installer script

# Install colorls
sudo bash ./colorls/colorls_installer.sh || die Error running Colorls Installer script

# Install ZSH
sudo bash ./zsh/zsh_installer.sh || die Error running ZSH Installer script

# Install Neovim
sudo bash ./neovim/nvim_installer.sh || die Error running Neovim Installer script

# NOTE: Polybar is not included, as its mostly going to become redundant in future ricing
