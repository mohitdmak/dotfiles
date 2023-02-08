#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
windows=""
settings=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}
# @MOHITDMAK: THIS FILE SERVES AS MENU

# Variable passed to rofi
options="$terminal\n$browser\n$files\n$windows\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        if [[ -f /usr/bin/alacritty ]]; then
            selected=$(ls ~/dotfiles/scripts/|rofi -dmenu -p "Run: ")&&bash ~/dotfiles/scripts/$selected
            # notify-send 'heck'
		elif [[ -f /usr/bin/alacritty ]]; then
			alacritty &
		# elif [[ -f /usr/bin/urxvt ]]; then
		# 	urxvt &
		# elif [[ -f /usr/bin/kitty ]]; then
		# 	kitty &
		elif [[ -f /usr/bin/xterm ]]; then
			xterm &
		# elif [[ -f /usr/bin/xfce4-terminal ]]; then
		# 	xfce4-terminal &
		elif [[ -f /usr/bin/gnome-terminal ]]; then
			gnome-terminal &
		else
			msg "No suitable terminal found!"
		fi
        ;;
    $files)
		if [[ -f /usr/bin/rofi ]]; then
			rofi -show drun &
		# elif [[ -f /usr/bin/pcmanfm ]]; then
		# 	pcmanfm &
		else
			msg "No suitable file manager found!"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/nvim ]]; then
			nvim &
		# elif [[ -f /usr/bin/leafpad ]]; then
		# 	leafpad &
		# elif [[ -f /usr/bin/mousepad ]]; then
		# 	mousepad &
		elif [[ -f /usr/bin/code ]]; then
			code &
		else
			msg "No suitable text editor found!"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/brave-browser ]]; then
			# notify-send "XDG_CURRENT_DESKTOP="KDE" brave-browser &"
			XDG_CURRENT_DESKTOP="KDE" brave-browser &
		elif [[ -f /snap/bin/brave ]]; then
			XDG_CURRENT_DESKTOP="KDE" brave &
		elif [[ -f /usr/bin/microsoft-edge ]]; then
			XDG_CURRENT_DESKTOP="KDE" microsoft-edge &
		elif [[ -f /usr/bin/google-chrome ]]; then
			XDG_CURRENT_DESKTOP="KDE" google-chrome &
		else
			msg "No suitable web browser found!"
		fi
        ;;
    $windows)
		if [[ -f /usr/bin/rofi ]]; then
			rofi -show window &
		else
			msg "No suitable rofi window reader found!"
		fi
        ;;
    $settings)
		if [[ -f /usr/bin/xfce4-settings-manager ]]; then
			xfce4-settings-manager &
        elif [[ -f /usr/bin/nvim ]]; then
            alacritty --title="ConfigSettings" -e nvim &
		else
			msg "No suitable settings manager found!"
		fi
        ;;
esac
