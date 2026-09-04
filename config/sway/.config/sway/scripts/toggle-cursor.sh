#!/bin/bash

TARGET="type:touchpad"

STATUS=$(swaymsg -t get_inputs | jq -r ".[] | select(.type==\"touchpad\") | .libinput.send_events" | head -n1)

if [ "$STATUS" = "enabled" ]; then
  swaymsg input "$TARGET" events disabled
else
  swaymsg input "$TARGET" events enabled
fi
