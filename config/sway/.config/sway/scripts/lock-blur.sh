#!/usr/bin/env bash

# Inspired from `https://github.com/catppuccin/swaylock/blob/main/themes/mocha.conf`

swaylock \
  --daemonize \
  --screenshots \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --font "JetBrainsMono Nerd Font" \
  --font-size 32 \
  --disable-caps-lock-text \
  --clock \
  --timestr "%H:%M:%S" \
  --datestr "%a, %d %b %Y" \
  --indicator \
  --indicator-radius 95 \
  --indicator-thickness 3 \
  --ring-color 313244 \
  --ring-clear-color f5e0dc \
  --ring-ver-color 89b4fa \
  --ring-wrong-color eba0ac \
  --inside-color 1e1e2e99 \
  --inside-clear-color 1e1e2e99 \
  --inside-ver-color 1e1e2e99 \
  --inside-wrong-color 1e1e2e99 \
  --text-color cdd6f4 \
  --text-clear-color f5e0dc \
  --text-ver-color 89b4fa \
  --text-wrong-color eba0ac \
  --key-hl-color a6e3a1 \
  --bs-hl-color f5e0dc \
  --line-color 00000000 \
  --line-clear-color 00000000 \
  --line-ver-color 00000000 \
  --line-wrong-color 00000000 \
  --separator-color 00000000 \
  --grace 0 \
  --fade-in 0.2
