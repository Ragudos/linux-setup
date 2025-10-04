#!/usr/bin/env bash

# Get brightness percentage
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
percent=$((brightness * 100 / max_brightness))

# Build ASCII bar
filled=$((percent / 5))
empty=$((5 - filled))
bar=$(printf '█%.0s' $(seq 1 $filled))
pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

# Icon
icon="󰛨"

# Color thresholds
if [ "$percent" -lt 20 ]; then
    fg="#bf616a"  # red
elif [ "$percent" -lt 55 ]; then
    fg="#fab387"  # orange
else
    fg="#56b6c2"  # cyan
fi

# Device name (first column from brightnessctl --machine-readable)
device=$(brightnessctl --machine-readable | awk -F, 'NR==1 {print $1}')

# Tooltip text
tooltip="Brightness: $percent%\nDevice: $device"

# JSON output
echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $percent%</span>\",\"tooltip\":\"$tooltip\"}"

