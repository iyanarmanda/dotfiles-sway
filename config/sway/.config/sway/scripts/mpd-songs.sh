#!/usr/bin/env bash

swaymsg mode "default"

theme="$HOME/.config/rofi/mpd-songs.rasi"

songs=$(mpc playlist -f "[[%artist% - %title%]|[%file%]]")

if [ -z "$songs" ]; then
    notify-send \
        -a mpd \
        -h string:x-canonical-private-synchronous:mpd_song \
        "MPD" \
        "Songs is empty."
    exit 1
fi

index=$(echo "$songs" | rofi -dmenu -i -p "󰎈 Songs" -format i -theme "$theme")

if [ -n "$index" ]; then
    track_num=$((index + 1))
    mpc play "$track_num" > /dev/null   
fi

swaymsg mode "mpd"
