#!/bin/bash

# Get volume and mute status
VOLUME_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
MUTED=$(echo "$VOLUME_RAW" | grep -q MUTED && echo "true" || echo "false")

# Get volume as a clean rounded integer
VOLUME=$(echo "$VOLUME_RAW" | awk '{ print $2 * 100 }' | xargs printf "%.0f\n")

# Select icon and class
if [[ "$MUTED" == "true" ]]; then
    ICON="󰸈"
    CLASS="vol-muted"
elif (( VOLUME == 0 )); then
    ICON="󰸈"
    CLASS="vol-muted"
elif (( VOLUME <= 30 )); then
    ICON="󰕿"
    CLASS="vol-low"
elif (( VOLUME <= 70 )); then
    ICON="󰖀"
    CLASS="vol-medium"
else
    ICON="󰕾"
    CLASS="vol-high"
fi

echo "$CLASS"