#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/polybar/cuts/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        systemctl poweroff
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		# 	exit 0
		#         else
		# 	msg
		#         fi
        ;;
    $reboot)
        systemctl reboot
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		# 	exit 0
		#         else
		# 	msg
		#         fi
        ;;
    $lock)
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock -i ~/dotfiles/i3wm/.config/i3/wallpapers/mars.png -ef
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $suspend)
        # enabling keyboard if disabled due to external connection
        xinput enable "AT Translated Set 2 keyboard" 
        notify-send "[[ Re-Enabling system default keyboard before suspension ]]"
        mpc -q pause
        amixer set Master mute
        # i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/mars.png -ef
        i3lock -i ~/dotfiles/i3wm/.config/i3/starred_wallpapers/0005.png -ef
        systemctl suspend
		# ans=$(confirm_exit &)
		# if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
		# elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		# 	exit 0
		#         else
		# 	msg
		#         fi
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
				i3-msg exit
			fi
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
