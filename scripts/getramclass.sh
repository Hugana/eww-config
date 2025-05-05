#!/bin/bash

# Get total and used memory in MiB
total=$(free -m | awk '/^Mem:/ {print $2}')
used=$(free -m | awk '/^Mem:/ {print $3}')

# Calculate usage percentage (rounded)
PERCENT=$(( (used * 100 + total / 2) / total ))

# Select icon and class
if (( PERCENT <= 30 )); then
    CLASS="ram-low"
elif (( PERCENT <= 70 )); then
    CLASS="ram-medium"
else
    CLASS="ram-high"
fi

# Output class only
echo "$CLASS"
