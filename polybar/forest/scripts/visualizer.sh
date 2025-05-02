#!/bin/bash

# Number of bars to draw
bars=20

# Characters from lowest to highest
chars=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

# Get volume or peak data
while true; do
    # Get current volume (0–100)
    vol=$(pamixer --get-volume)
    vol=$((vol * ${#chars[@]} / 100))

    # Build the visual bar
    bar=""
    for ((i=0; i<bars; i++)); do
        r=$((RANDOM % (vol + 1)))
        bar+="${chars[r]}"
    done

    echo "$bar"
    sleep 0.1
done