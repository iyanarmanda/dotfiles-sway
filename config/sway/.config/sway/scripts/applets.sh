#!/usr/bin/env bash

theme="$HOME/.config/rofi/applets.rasi"

option_1="󰗊"
option_2="󰙯"
option_3="󰂯"

rofi_cmd() {
    rofi -theme-str "listview {columns: 1; lines: 3;}" \
        -dmenu \
        -markup-rows \
        -theme ${theme}
}

run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}

toggle_fcitx() {
    if pgrep -x "fcitx5" > /dev/null || pgrep -x "fcitx" > /dev/null; then
        pkill -x fcitx5 || pkill -x fcitx
    else
        (fcitx5 -d || fcitx -d) &>/dev/null &
    fi
}

toggle_vesktop() {
    if pgrep -f "vesktop" > /dev/null; then
        pkill -f vesktop
    else
        vesktop --start-minimized &>/dev/null &
    fi
}

toggle_bluetooth() {
    notify-send -u low "Bluetooth" "on Development"
}

run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		toggle_fcitx
	elif [[ "$1" == '--opt2' ]]; then
		toggle_vesktop
	elif [[ "$1" == '--opt3' ]]; then
		toggle_bluetooth
        fi
}

chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
esac
