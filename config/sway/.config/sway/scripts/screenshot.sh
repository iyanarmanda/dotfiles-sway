#!/usr/bin/env bash

DIR="${HOME}/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="${DIR}/screenshot-$(date +'%Y%m%d%H%M%S').png"

case "$1" in
    full)
        grim "$FILE" && wl-copy < "$FILE"
        notify-send -u low "Screenshot" "Fullscreen print saved & copied to clipboard"
        ;;
    area)
        GEOM=$(slurp)
        if [ -n "$GEOM" ]; then
            grim -g "$GEOM" "$FILE" && wl-copy < "$FILE"
            notify-send -u low "Screenshot" "Selective print saved & copied to clipboard"
        fi
        ;;
    *)
        echo "Usage: $0 {full|area}"
        exit 1
        ;;
esac
