#!/usr/bin/env bash

rofi_command="rofi -theme themes/bluetooth.rasi"

## Icons
switch=""
settings=""
restart="ﰇ"


active=""
urgent=""


## Is up
if [[ -z $(hciconfig | grep DOWN) ]]; then
    STATUS="Up"
    MSG=" Scanning..."

    DEVICE_NAME=$(echo info | bluetoothctl | grep Name | awk '{print $2}')
    MAC_ADDRESS=$(echo info | bluetoothctl | grep Device | awk '{print $2}')

    if [[ ! -z "$DEVICE_NAME" ]]; then
        MSG=" Connected ($DEVICE_NAME)"
        active="-a 0"
    fi


else
    STATUS="Down"
    MSG=" Dongle down"

    urgent="-u 0"
fi


options="$switch\n$settings\n$restart"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $switch)
		if [[ $STATUS == "Down" ]]; then
            bluetoothctl power on
		    dunstify -a Bluetooth "Bluetooth off" "Disabled"
        else
            bluetoothctl power off          	
            dunstify -a Bluetooth "Bluetooth on" "Enabled"
		fi 
        ;;
    $settings)
        blueman-manager
        ;;
    $restart)
        systemctl restart bluetooth
        ;;
esac

