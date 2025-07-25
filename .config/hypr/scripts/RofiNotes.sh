#!/usr/bin/env zsh

folder="$HOME/Documents/Notes/"

newnote() {
  local name
  pkill rofi || true
  name=$(rofi -dmenu -l 0 -p "Enter note name: ") || exit 0
  : "${name:=$(date +%F_%T | tr ':' '-')}"
  kitty -e sh -c "cd \"$folder\" && nvim \"$name\""
}

selected() {
  local choice
  pkill rofi || true
  choice=$(echo -e "New\n$(ls -t1 $folder)" | rofi -dmenu -theme-str 'window { width: 50%; }' -i -p "Choose note: ")
  case $choice in
    New) newnote ;;
    *.md) setsid -f kitty -e nvim "$folder$choice" >/dev/null 2>&1 ;;
    *) exit ;;
  esac
}

selected
