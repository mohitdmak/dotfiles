#!/bin/bash

LOOPING_NOTIF_ID=1

if [[ $(playerctl --player=spotify loop | grep 'Track') == *Track* ]]; then
    playerctl --player=spotify loop playlist
    LOOPING_NOTIF_ID=$(notify-send --urgency=low --app-name=Spotify -p "[@mohitdmak] Looping set to Playlist")
    # notify-send "${LOOPING_NOTIF_ID}"
elif [[ $(playerctl --player=spotify loop | grep 'Playlist') == *Playlist* ]]; then
    playerctl --player=spotify loop track
    LOOPING_NOTIF_ID=$(notify-send --urgency=low --app-name=Spotify -p "[@mohitdmak] Looping set to Track")
    # notify-send "${LOOPING_NOTIF_ID}"
else
    playerctl --player=spotify loop track
    LOOPING_NOTIF_ID=$(notify-send --urgency=low --app-name=Spotify -p "[@mohitdmak] Looping set to Track")
    # notify-send "${LOOPING_NOTIF_ID}"
fi

