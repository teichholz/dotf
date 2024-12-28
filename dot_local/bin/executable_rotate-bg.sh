#!/bin/bash

walls_dir=$HOME/Pictures/backgrounds/
current=$(gsettings get org.gnome.desktop.background picture-uri-dark)
# replaces file:// with noting
current=${current/file:\/\//}
# replaces '' with nothing
current=${current//\'/}

selection=$(find "$walls_dir" -type f \( -iname "*.jpg" -o -iname "*.png" \) | grep -v $current | shuf -n1)


if command -v gsettings; then
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$selection"
fi
