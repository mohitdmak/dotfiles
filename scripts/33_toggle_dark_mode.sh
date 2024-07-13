#!/bin/bash

## script helpers
DOTFILES="$HOME/legacy_dotfiles"
ANCHOR_TAG="@@@LIGHT_DARK_MODE@@@"
LIGHT_DARK_MODE_DATA_FILE=$DOTFILES/scripts/data_current_dark_light_mode

## configs for different elements
TMUX_CONFIG_FILE="$DOTFILES/tmux/.tmux.conf.local"
NVIM_CONFIG_FILE=$DOTFILES/neovim/.config/nvim/lua/user/colorscheme.lua
ALACRITTY_CONFIG_FILE=$DOTFILES/alacritty/.config/alacritty/alacritty.toml

## config settings for elements
ALACRITTY_DARK="    \"~/.config/alacritty/themes/themes/one_dark.toml\" # NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"
ALACRITTY_LIGHT="   \"~/.config/alacritty/themes/themes/solarized_light.toml\" # NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"
NVIM_DARK="    set background=dark \" NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"
NVIM_LIGHT="    set background=light \" NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"
TMUX_DARK="set -g @tmux-gruvbox 'dark' # NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"
TMUX_LIGHT="set -g @tmux-gruvbox 'light' # NOTE: ### MANAGED BY @@@LIGHT_DARK_MODE@@@ TOGGLING SCRIPT ###"

### get current dark/light mode - true = light, false = dark
CURR_MODE=$(cat $LIGHT_DARK_MODE_DATA_FILE)

update_state (){
    if [[ $CURR_MODE == "TRUE" ]]; then
        sed -i "/TRUE/c\FALSE" $LIGHT_DARK_MODE_DATA_FILE
    else 
        sed -i "/FALSE/c\TRUE" $LIGHT_DARK_MODE_DATA_FILE
    fi
    # alacritty updates itself instantly
    # update tmux state
    tmux source ~/.tmux.conf
    # update all existing nvim sessions
    NVIM_SESSIONS=$(pgrep -f /squashfs-root/usr/bin/nvim)
    for nvim_session in ${NVIM_SESSIONS}; do
        nvim --server /run/user/1000/nvim.$nvim_session.0 --remote-send ':source ~/.config/nvim/lua/user/colorscheme.lua<CR>'
    done
    # update btm reports if exists
    BTM_SESSION=$(pgrep -f btm)
    if [[ $BTM_SESSION != "" ]]; then
        tmux select-window -t:'reports' 
        sleep 1
        notify-send "[SYSTEMD SERVICE NOTIF]: @mohtidmak: Btm reports found, recreating monitor . . ."
        tmux send-keys -t:'reports' q
        if [[ $CURR_MODE == "TRUE" ]]; then
            tmux send-keys -t:'reports' C-z 'btm --color gruvbox --battery' Enter
            tmux send-keys -t:'reports' m
            tmux send-keys -t:'reports' %
            tmux send-keys -t:'reports' Tab
        else 
            tmux send-keys -t:'reports' C-z 'btm --color gruvbox-light --battery' Enter
            tmux send-keys -t:'reports' m
            tmux send-keys -t:'reports' %
            tmux send-keys -t:'reports' Tab
        fi
    fi
}

if [[ $CURR_MODE == "TRUE" ]]; then
    sed -i "/$ANCHOR_TAG/c\\${ALACRITTY_DARK}" $ALACRITTY_CONFIG_FILE
    sed -i "/$ANCHOR_TAG/c\\${NVIM_DARK}" $NVIM_CONFIG_FILE
    sed -i "/$ANCHOR_TAG/c\\${TMUX_DARK}" $TMUX_CONFIG_FILE
    update_state
    # echo "FALSE" > $LIGHT_DARK_MODE_DATA_FILE
    notify-send "[SYSTEMD SERVICE NOTIF]: @mohtidmak: Switched alacritty + nvim + tmux to dark"
elif [[ $CURR_MODE == "FALSE" ]]; then
    sed -i "/$ANCHOR_TAG/c\\${ALACRITTY_LIGHT}" $ALACRITTY_CONFIG_FILE
    sed -i "/$ANCHOR_TAG/c\\${NVIM_LIGHT}" $NVIM_CONFIG_FILE
    sed -i "/$ANCHOR_TAG/c\\${TMUX_LIGHT}" $TMUX_CONFIG_FILE
    update_state
    # echo "TRUE" > $LIGHT_DARK_MODE_DATA_FILE
    notify-send "[SYSTEMD SERVICE NOTIF]: @mohtidmak: Switched alacritty + nvim + tmux to light"
else
    notify-send -u critical "[SYSTEMD SERVICE NOTIF]: @mohtidmak: Problem switching light/dark modes (data config file corrupted prolly)"
fi
