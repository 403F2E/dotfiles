#!/bin/sh

HYPRLAND_DEVICE="alp0011:00-044e:120c"

CONFIG_FILE=~/.config/hypr/UserConfigs/UserSettings.conf


if [ -z "$XDG_RUNTIME_DIR" ]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
  printf "true" > "$STATUS_FILE"

  notify-send -u normal "Enabling Touchpad"

  sed -i '/device {/,/}/ {
    s/enabled=false/enabled=true/
  }' $CONFIG_FILE

  hyprctl reload
}

disable_touchpad() {
  printf "false" > "$STATUS_FILE"

  notify-send -u normal "Disabling Touchpad"

  sed -i '/device {/,/}/ {
    s/enabled=true/enabled=false/
  }' $CONFIG_FILE

  hyprctl reload
}

if ! [ -f "$STATUS_FILE" ]; then
  disable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_touchpad
  fi
fi
