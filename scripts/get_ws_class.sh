#!/bin/bash

# Usage: ./get_ws_class.sh <workspace_number>
ws_number="$1"

# Get the currently focused workspace ID
focused=$(hyprctl activeworkspace -j | jq -r '.id')

# Compare and output the class
if [[ "$ws_number" == "$focused" ]]; then
  echo "ws-active"
else
  echo "ws-btn"
fi
