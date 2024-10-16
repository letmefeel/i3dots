#!/bin/bash

# Get current brightness
CURRENT_BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$(( CURRENT_BRIGHTNESS * 100 / MAX_BRIGHTNESS ))

# Output brightness percentage only
echo "${PERCENTAGE}%"
