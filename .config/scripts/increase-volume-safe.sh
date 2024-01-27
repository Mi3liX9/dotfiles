#!/bin/bash

# Get the current volume and remove the '%' sign
CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -n 1)

# Define the maximum allowed volume
MAX_VOLUME=100

# Calculate what the new volume would be if increased by 5%
NEW_VOLUME=$((CURRENT_VOLUME + 5))

if [ "$NEW_VOLUME" -le "$MAX_VOLUME" ]; then
    # If the new volume is less than or equal to the max, set the new volume
    pactl set-sink-volume @DEFAULT_SINK@ +5%
else
    # Otherwise, set the volume to the max
    pactl set-sink-volume @DEFAULT_SINK@ "$MAX_VOLUME%"
fi

