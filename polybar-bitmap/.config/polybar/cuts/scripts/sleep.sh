#!/usr/bin/env bash
mpc -q pause
amixer set Master mute
i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/mars.png -ef
systemctl suspend
