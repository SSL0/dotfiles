#!/usr/bin/env bash

rofi_command="rofi -theme themes/network.rasi"

## Get info
IFACE="$(nmcli | grep -i interface | awk '/interface/ {print $2}')"
#SSID="$(iwgetid -r)"
#LIP="$(nmcli | grep -i server | awk '/server/ {print $2}')"
#PIP="$(dig +short myip.opendns.com @resolver1.opendns.com )"
STATUS="$(nmcli radio wifi)"

active=""
urgent=""

if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
	if [[ $STATUS == *"enable"* ]]; then
        if [[ $IFACE == e* ]]; then
            connected=""
        else
            connected="直"
        fi
	active="-a 0"
	MSG="﬉ Online"
	PIP="$(dig +short myip.opendns.com @resolver1.opendns.com )"
	fi
else
    urgent="-u 0"
    MSG="Offline"
    PIP="Not Available"
    connected="睊"
fi

## Icons
settings="歷"
launch_cli=""
launch="龍"

options="$connected\n$settings\n$launch_cli\n$launch"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $connected)
		if [[ $STATUS == *"enable"* ]]; then
			nmcli radio wifi off
            dunstify -a Network "Network off" "Disabled"
		else
			nmcli radio wifi on
            dunstify -a Network "Network on" "Enabled."
		fi 
        ;;
    $settings)
        ~/.config/rofi/scripts/wifi_switch.sh &
        ;;
    $launch_cli)
        urxvt -e nmtui
        ;;
    $launch)
        nm-connection-editor
        ;;
esac

