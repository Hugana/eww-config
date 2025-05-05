#!/bin/bash

# Get volume and mute status
VOLUME_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
# Get volume as a clean rounded integer
VOLUME=$(echo "$VOLUME_RAW" | awk '{ print $2 * 100 }' | xargs printf "%.0f\n")

echo "$VOLUME%"