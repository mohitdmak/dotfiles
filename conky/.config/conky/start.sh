#!/bin/bash

killall conky
sleep 2s
		
# conky -c $HOME/.config/conky/Shortcuts_1 &> /dev/null &
# conky -c $HOME/.config/conky/Shortcuts_2 &> /dev/null &
# conky -c $HOME/.config/conky/network &> /dev/null &
# conky -c $HOME/.config/conky/Calendar &> /dev/null &
# conky -c $HOME/.config/conky/network2 &> /dev/null &
# conky -c $HOME/.config/conky/audacious &> /dev/null &
# conky -c $HOME/.config/conky/System_Info &> /dev/null &
# conky -c $HOME/.config/conky/Weather-Clock &> /dev/null &

conky -c $HOME/.config/conky/e2 &> /dev/null &

exit
