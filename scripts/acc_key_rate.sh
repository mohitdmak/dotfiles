#!/bin/bash

# i3-msg restart
xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = BackSpace" 
xset r rate 200 35
notify-send "[SYS_DEVICE NOTIF]: @mohtidmak: Keyboard driver rate + mappings customized."
