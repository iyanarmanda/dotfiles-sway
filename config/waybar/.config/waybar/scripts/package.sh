#!/usr/bin/env bash

if ! command -v checkupdates &> /dev/null; then
    printf '{"text":"install pacman-contrib","class":"error"}\n'
    exit 1
fi

pacman_updates=$(checkupdates 2>/dev/null | wc -l)

aur_updates=$(paru -Qua 2>/dev/null | wc -l)

pacman_updates=${pacman_updates:-0}
aur_updates=${aur_updates:-0}

total=$((pacman_updates + aur_updates))

if [ "$total" -gt 0 ]; then
    text="󰚰 ${pacman_updates}+${aur_updates} available"
    class="has-updates"
else
    text="󰄴 up to date"
    class="updated"
fi

printf '{"text":"%s","class":"%s"}\n' "$text" "$class"
