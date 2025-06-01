#!/bin/sh
grim - | swappy -f - && [[ $(wl-paste -l) == "image/png" ]] && notify-send "Screenshot copied to clipboard"
