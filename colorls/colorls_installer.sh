#!/bin/bash

# Here scripts will arrive if they fail
die(){
  echo "\nFAIL"
  echo "$*" 1>&2
  exit 1
}

# Install ruby for colorls
sudo apt-get install ruby-full || die Apt-get couldnt install ruby for colorls
ruby -v || die Ruby not installed properly

# TODO: Download and install nerdfont
# Install colorls 
gem install colorls || die gem couldnt install colorls
colorls -v || die Colorls not installed properly

# Update colorls configurations
cd $(dirname $(gem which colorls)) || die Couldnt find colorls configuration directory
rm -rf * || die Couldnt empty colorls defautl configuration directory
sudo cp -r $HOME/colorls_config/*  $(dirname $(gem which colorls)) || die Couldnt create custom colorls config
