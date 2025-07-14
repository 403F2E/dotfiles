#!/usr/bin/env zsh

cleanup() {
  echo "" > /tmp/timericon;
  exit 0
}

timer () {
  trap cleanup SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM # 1 2 3 6 15
  while [ $TOTAL_SECONDS -gt 0 ]; do
    MIN=$(printf "%02d" $((TOTAL_SECONDS / 60)))
    SEC=$(printf "%02d" $((TOTAL_SECONDS % 60)))
    echo "  $MIN $SEC " > /tmp/timericon;
    sleep 1
    ((TOTAL_SECONDS--))
  done

  notify-send "Timer ended, do what do u need to do"
  cleanup
}

menu () {
  MINUTES=$(echo "" | rofi -dmenu -l 0 -theme-str "entry { placeholder: 'Minutes: ';}")
  TOTAL_SECONDS=$((MINUTES * 60))
  timer
}

case "$#" in
  0) menu ;;
  1) notify-send "Killing timer..." & kill -TERM $(pgrep -f ~/.local/bin/statusbar/status-timer) ;;
esac
