#!/bin/bash

## script helpers
DOTFILES="$HOME/legacy_dotfiles"
ANCHOR_TAG="@@@LIGHT_DARK_MODE@@@"
LIGHT_DARK_MODE_DATA_FILE="data_current_dark_light_mode"

## configs for different elements
TMUX_CONFIG_FILE="$DOTFILES/tmux/.tmux.conf.local"
NVIM_CONFIG_FILE=$DOTFILES/neovim/.config/nvim/lua/user/colorscheme.lua
ALACRITTY_CONFIG_FILE=$DOTFILES/alacritty/.config/alacritty/alacritty.toml
# ALACRITTY_CONFIG_FILE=~/legacy_dotfiles/scripts/todo.md

## config settings for elements
ALACRITTY_DARK="    \"~/.config/alacritty/themes/themes/one_dark.toml\" # NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"
ALACRITTY_LIGHT="   \"~/.config/alacritty/themes/themes/solarized_light.toml\" # NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"

### get current dark/light mode - true = light, false = dark
CURR_MODE=$(cat $DOTFILES/scripts/$LIGHT_DARK_MODE_DATA_FILE)

update_state (){
    if [[ $CURR_MODE == "TRUE" ]]; then
        sed -i "/TRUE/c\FALSE" $LIGHT_DARK_MODE_DATA_FILE
    else 
        sed -i "/FALSE/c\TRUE" $LIGHT_DARK_MODE_DATA_FILE
    fi
}

if [[ $CURR_MODE == "TRUE" ]]; then
    sed -i "/$ANCHOR_TAG/c\\${ALACRITTY_DARK}" $ALACRITTY_CONFIG_FILE
    update_state
elif [[ $CURR_MODE == "FALSE" ]]; then
    sed -i "/$ANCHOR_TAG/c\\${ALACRITTY_LIGHT}" $ALACRITTY_CONFIG_FILE
    update_state
else
    notify-send -u critical "[SYSTEMD SERVICE NOTIF]: @mohtidmak: Problem switching light/dark modes (data config file corrupted prolly)"
fi
