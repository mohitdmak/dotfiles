#!/usr/bin/env bash
# enabling keyboard if disabled due to external connection
xinput enable "AT Translated Set 2 keyboard" 
notify-send "[[ Re-Enabling system default keyboard before suspension ]]"
mpc -q pause
amixer set Master mute
# i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/mars.png -ef
# i3lock -i /home/mohitdmak/.config/i3/wallpapers/0062.jpg -ef
i3lock -i ~/.config/i3/starred_wallpapers/0005.png -ef
systemctl suspend
