#!/usr/bin/env bash

swaymsg mode "default"

theme="$HOME/.config/rofi/mpd-playlist.rasi"

playlists=$(mpc lsplaylists)

if [ -z "$playlists" ]; then
    notify-send \
        -a mpd \
        -h string:x-canonical-private-synchronous:mpd_playlist \
        "MPD" \
        "Playlists is empty"
    exit 1
fi

selected=$(echo "$playlists" | rofi -dmenu -i -p "󰲹 Playlist" -theme "$theme")

if [ -n "$selected" ]; then
    mpc clear
    mpc load "$selected"
    mpc play
    notify-send \
        -a mpd \
        -h string:x-canonical-private-synchronous:mpd_playlist \
        "(MPD) Play playlist:" \
        "$selected"
fi

swaymsg mode "mpd"
