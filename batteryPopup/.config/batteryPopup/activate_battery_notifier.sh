#!/bin/bash
notify-send "Setting low power notifications in place . . ."

# /home/mohitdmak/.config/batteryPopup/i3-battery-popup -n -s /home/mohitdmak/.config/batteryPopup/battery-popup.wav -L 20 -t 2m
/home/arch/.config/batteryPopup/i3-battery-popup -n -s /home/arch/.config/batteryPopup/battery-popup.wav -L 20 -t 2m
# /home/mohitdmak/.config/batteryPopup/i3-battery-popup -n -s /home/mohitdmak/.config/batteryPopup/battery-popup.wav -L 6 -t 2m
# /home/mohitdmak/.config/batteryPopup/activate_battery_notifier.sh -n -s /home/mohitdmak/.config/batteryPopup/battery-popup.wav -L 20 -t 5m
# echo Test
# wall "Check systemctl"
