#!/bin/bash

# NOTE: These values are not expected to change, however if the behaviour of this script is not as expected, run `xinput list` to note new values for these:
# SYSTEM_KEYBOARD_ID = id of 'AT Translated Set 2 keyboard'
# SLAVE_KEYBOARD_ID = id of 'slave keyboard (#)'
SYSTEM_KEYBOARD_ID=13
SLAVE_KEYBOARD_ID=3
# DEVICE_ENABLED_STATUS="Device Enabled (180): 1"
# DEVICE_DISABLED_STATUS="Device Enabled (180): 0"

DEVICE_STATUS=$(xinput list-props "AT Translated Set 2 keyboard" | awk '/^\tDevice Enabled \([0-9]+\):\t[01]/ {print $NF}')

case $DEVICE_STATUS in                                                                
  0)                                                                            
    notify-send "Enabling System Keyboard. . ."
    xinput enable "$SYSTEM_KEYBOARD_ID"
    echo "System keyboard enabled"
    ;;                                                                          
  1)                                                                            
    notify-send "Disabling System Keyboard. . ."
    xinput disable "$SYSTEM_KEYBOARD_ID"
    echo "System keyboard disabled"
    ;;                                                                          
  *)                                                                            
    echo
    xinput list --name-only
    ;;                                                                          
esac
