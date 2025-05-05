#!/bin/bash

STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "Unknown")
PERC=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo 0)

echo "$PERC%"
