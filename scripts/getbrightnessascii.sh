#!/bin/bash

# Get backlight device (first one found)
BACKLIGHT_DIR="/sys/class/backlight"
DEVICE=$(ls "$BACKLIGHT_DIR" | head -n 1)
DEVICE_PATH="$BACKLIGHT_DIR/$DEVICE"

# Read brightness and max brightness
BRIGHTNESS=$(< "$DEVICE_PATH/brightness")
MAX_BRIGHTNESS=$(< "$DEVICE_PATH/max_brightness")

# Calculate percentage
PERCENT=$(( BRIGHTNESS * 100 / MAX_BRIGHTNESS ))

# Select icon
if (( PERCENT <= 10 )); then
    ICON="󱩎"
elif (( PERCENT <= 30 )); then
    ICON="󱩐"
elif (( PERCENT <= 70 )); then
    ICON="󱩓"
else
    ICON="󰛨"
fi

# Build ASCII bar
BLOCKS=5
FILLED=$(( (PERCENT * BLOCKS + 50) / 100 ))
(( FILLED > BLOCKS )) && FILLED=$BLOCKS

BAR=""
for ((i = 1; i <= BLOCKS; i++)); do
  if (( i <= FILLED )); then
    BAR+="█"
  else
    BAR+="▒"
  fi
done

# Output
printf "%s %s\n" "$ICON" "$BAR"
