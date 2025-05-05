#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

# Define available profiles
profiles=(performance balanced power-saver)

# Find current profile's index
for i in "${!profiles[@]}"; do
  if [[ "${profiles[$i]}" == "$current" ]]; then
    next_index=$(( (i + 1) % ${#profiles[@]} ))
    break
  fi
done

# Set the next profile
powerprofilesctl set "${profiles[$next_index]}"
