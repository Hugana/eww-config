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

echo "$PERCENT%"
