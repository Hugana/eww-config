#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT0"
BAT=$(cat "$BAT_PATH/capacity" 2>/dev/null || echo 0)
STATUS=$(cat "$BAT_PATH/status" 2>/dev/null || echo "Unknown")
AC_STATUS=$(cat /sys/class/power_supply/AC0/online 2>/dev/null)


# Nerd Font charging icons: U+F89C to U+F8A4
# Reference: https://www.nerdfonts.com/cheat-sheet (search battery-charging)
if [[ "$AC_STATUS" == "1" ]]; then
    if (( BAT >= 95 )); then ICON="󰂅"  # charging-100
    elif (( BAT >= 80 )); then ICON="󰂊"  # charging-80
    elif (( BAT >= 60 )); then ICON="󰂉"  # charging-60
    elif (( BAT >= 40 )); then ICON="󰂈"  # charging-40
    elif (( BAT >= 20 )); then ICON="󰂆"  # charging-20
    else ICON="󰢝"; fi  # generic charging
else
    if (( BAT >= 95 )); then ICON="󰁹"  # full
    elif (( BAT >= 80 )); then ICON="󰂂"
    elif (( BAT >= 60 )); then ICON="󰁿"
    elif (( BAT >= 40 )); then ICON="󰁽"
    elif (( BAT >= 20 )); then ICON="󰁻"
    else ICON="󰂎"; fi  # empty
fi

# ASCII bar
BLOCKS=6
FILLED=$(( (BAT * BLOCKS) / 100 ))
EMPTY=$(( BLOCKS - FILLED ))

BAR=$(printf "%0.s█" $(seq 1 $FILLED))
BAR+=$(printf "%0.s▒" $(seq 1 $EMPTY))

echo "$ICON"
