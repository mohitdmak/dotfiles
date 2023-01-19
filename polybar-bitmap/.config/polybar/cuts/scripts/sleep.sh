#!/usr/bin/env bash
# enabling keyboard if disabled due to external connection
xinput enable "AT Translated Set 2 keyboard" 
notify-send "[[ Re-Enabling system default keyboard before suspension ]]"
mpc -q pause
amixer set Master mute
i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/mars.png -ef
systemctl suspend
