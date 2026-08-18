#!/bin/bash

case "$1" in
    toggle)
        makoctl mode -t do-not-disturb

        pkill -RTMIN+8 waybar
        ;;
    status)
        if makoctl mode | grep -q 'do-not-disturb'; then
            echo '󰂛'
        else
            echo ''
        fi
        ;;
    *)
        echo "usage: $0 {toggle|status}"
        exit 1
        ;;
esac
