#!/bin/bash

# Define the brightness step
STEP=10

# Adjust brightness based on the argument
case "$1" in
  up)
    brightnessctl set +${STEP}%
    ;;
  down)
    brightnessctl set ${STEP}%- 
    ;;
  *)
    echo "Usage: $0 {up|down}"
    exit 1
    ;;
esac

# Get the current brightness
CURRENT_BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)

# Calculate percentage
PERCENTAGE=$(( CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS ))

# Show notification
notify-send "Brightness" "Current brightness: ${PERCENTAGE}%"

