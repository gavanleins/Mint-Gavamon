#!/bin/bash
status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [[ $status == "Playing" ]]; then
    echo "⏸ $artist - $title"
elif [[ $status == "Paused" ]]; then
    echo "▶ $artist - $title"
else
    echo "⏹ No media"
fi
