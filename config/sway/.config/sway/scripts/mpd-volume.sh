#!/usr/bin/env bash

mpc volume "$1" > /dev/null

vol=$(mpc volume | grep -oP '\d+%' | head -n 1)

notify-send \
    -a mpd \
    -h string:x-canonical-private-synchronous:mpd_vol \
    -h int:value:"${vol%\%}" \
    "(MPD) Volume:" \
    "$vol"
