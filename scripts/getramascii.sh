#!/bin/bash

# Get total and used memory in MiB
total=$(free -m | awk '/^Mem:/ {print $2}')
used=$(free -m | awk '/^Mem:/ {print $3}')

# Calculate usage percentage (rounded)
PERCENT=$(( (used * 100 + total / 2) / total ))

# ASCII bar
BLOCKS=10
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

# Output result
printf "%s %s" "󰍛" "$BAR"
