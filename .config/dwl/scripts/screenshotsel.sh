#!/bin/sh
grim -g "$(slurp)" - | swappy -f - && [[ $(wl-paste -l) == "image/png" ]] && notify-send "Screenshot copied to clipboard"
