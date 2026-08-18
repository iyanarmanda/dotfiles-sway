#!/usr/bin/env bash

next_song=$(mpc queued -f "[[%artist% - %title%]|[%file%]]" 2>/dev/null)

if [ -z "$next_song" ]; then
    notify-send \
        -a mpd \
        -h string:x-canonical-private-synchronous:mpd_next \
        "MPD" \
        "Queue is empty"
else
    notify-send \
        -a mpd \
        -h string:x-canonical-private-synchronous:mpd_next \
        "(MPD) Next Song:" \
        "$next_song"
fi
