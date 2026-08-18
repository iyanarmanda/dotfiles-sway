#!/bin/bash

lock_script="$HOME/.config/sway/scripts/lock-wallpaper.sh"

start_idle() {
    swayidle -w \
        timeout 600 $lock_script \
        timeout 630 'swaymsg "output * power off"' \
        resume 'swaymsg "output * power on"' \
        before-sleep $lock_script &
}

case "$1" in
    start)
        if ! pgrep -x swayidle > /dev/null; then
            start_idle
        fi
        ;;
    toggle)
        if pgrep -x swayidle > /dev/null; then
            pkill -x swayidle
        else
            start_idle
        fi
        pkill -RTMIN+9 waybar
        ;;
    status)
        if pgrep -x swayidle > /dev/null; then
            echo ''
        else
            echo ''
        fi
        ;;
    *)
        echo "usage: $0 {start|toggle|status}"
        exit 1
        ;;
esac
