#!/bin/bash

# Get total and used memory in MiB
total=$(free -m | awk '/^Mem:/ {print $2}')
used=$(free -m | awk '/^Mem:/ {print $3}')

# Output: "3421MiB / 7864MiB"
echo "${used}MiB / ${total}MiB"
