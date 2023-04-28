#!/bin/bash

lock() {
    mpc -q pause
    amixer set Master mute
    # i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/mars.png -ef
    i3lock -i /home/arch/.config/i3/starred_wallpapers/mars.png -ef
    systemctl suspend
}

notify-user() {
    #Detect the user using such display
    local user=$(whoami)

    notify-send -u critical "[SYSTEMD POWER WARNING]: @mohitdmak VERY LOW POWER! (~5%); Suspending system to preserve state."
}

main(){
    acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
        read -r status capacity

        if [ "$status" = Discharging ]; then
            if [ "$capacity" -lt 5 ]; then
                notify-user
                lock
            fi
        fi
    }
}

while true; do
    main
    sleep 120
done
