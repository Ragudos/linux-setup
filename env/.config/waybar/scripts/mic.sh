#!/usr/bin/env bash

wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "[MUTED]"

if [ $? -eq 0 ]; then
  echo "<span foreground='#fab387'> [   ] </span>"
else
  echo "<span foreground='#56b6c2'> [   ] </span>"
fi

