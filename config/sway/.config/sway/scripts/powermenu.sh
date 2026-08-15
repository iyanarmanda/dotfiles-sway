#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu

# Current Theme
theme="$HOME/.config/rofi/powermenu.rasi"
confirmation_theme="$HOME/.config/rofi/powermenu-confirmation.rasi"

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown='󰐥'
reboot='󰜉'
lock='󰌾'
suspend='󰤄'
logout='󰍃'
yes='󰄬'
no=''

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "Later ${USER}" \
        -mesg "Uptime: $uptime" \
        -theme "$theme"
}

# Confirmation CMD
confirm_cmd() {
    rofi -dmenu \
        -p 'Confirmation' \
        -mesg 'Are you Sure?' \
        -theme $confirmation_theme
}

# Ask for confirmation
confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$shutdown\n$reboot\n$logout\n$suspend\n$lock" | rofi_cmd
}

# Execute Command
run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
            systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
            mpc -q pause
            systemctl suspend
        elif [[ $1 == '--logout' ]]; then
            swaymsg exit
        else
            exit 0
	fi
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
        run_cmd --shutdown
        ;;
    $reboot)
        run_cmd --reboot
        ;;
    $lock)
        "$HOME/.config/sway/scripts/lock-blur.sh"
        ;;
    $suspend)
        run_cmd --suspend
        ;;
    $logout)
        run_cmd --logout
        ;;
esac
