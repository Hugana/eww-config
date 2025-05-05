#!/bin/bash

# Get volume and mute status
VOLUME_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
MUTED=$(echo "$VOLUME_RAW" | grep -q MUTED && echo "true" || echo "false")

# Get volume as a clean rounded integer
VOLUME=$(echo "$VOLUME_RAW" | awk '{ print $2 * 100 }' | xargs printf "%.0f\n")

# Select icon
if [[ "$MUTED" == "true" ]]; then
    ICON="󰸈"
elif (( VOLUME == 0 )); then
    ICON="󰸈"
elif (( VOLUME <= 30 )); then
    ICON="󰕿"
elif (( VOLUME <= 70 )); then
    ICON="󰖀"
else
    ICON="󰕾"
fi

# Build ASCII bar
BLOCKS=10
FILLED=$(( (VOLUME * BLOCKS + 50) / 100 ))
(( FILLED > BLOCKS )) && FILLED=$BLOCKS

BAR=""
for ((i = 1; i <= BLOCKS; i++)); do
  if (( i <= FILLED )); then
    BAR+="█"
  else
    BAR+="▒"
  fi
done

printf "%s %s" "$ICON" "$BAR"