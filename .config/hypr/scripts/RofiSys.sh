#!/usr/bin/env zsh

case "$(printf "kill\nzzz\nreboot\nshutdown" | rofi -dmenu -i -c -l 4)" in
	kill) ps -u $USER -o pid,comm,%cpu,%mem | rofi -dmenu -i -c -l 10 -mesg " Kill : " | awk '{print $1}' | xargs -r kill ;;
	zzz) systemctl hibernate;;
	reboot) reboot ;;
	shutdown) shutdown ;;
	*) exit 1 ;;
esac
