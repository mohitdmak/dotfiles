#!/bin/bash

# bash /home/mohitdmak/dotfiles/polybar-bitmap/.config/polybar/cuts/preview.sh
killall -q polybar && while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done && polybar
notify-send "[SYS_I3 NOTIF]: @mohtidmak: Poly status refreshed."
