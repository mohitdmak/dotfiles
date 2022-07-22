#!/bin/bash

lock() {
    mpc -q pause
    amixer set Master mute
    i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/mars.png -ef
    systemctl suspend
}

notify-user() {
    #Detect the user using such display
    local user=$(whoami)

    notify-send -u critical -t 4000 "battery warning" "\n$user, your battery is low"
}

main(){
    acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
        read -r status capacity

        if [ "$status" = Discharging ]; then
            if [ "$capacity" -lt 5 ]; then
                lock
            fi
        fi
    }
}

while true; do
    main
    sleep 180
done
