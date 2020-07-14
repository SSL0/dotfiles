#!/bin/sh

if [[ ! -z $(hciconfig | grep DOWN) ]]; then 
	echo "%{F#42a5f5}%{F-}"
else
	device_name=$(echo info | bluetoothctl | grep 'Name' | awk '{print $2}')
	if [[ -z device_name ]]; then 
		echo "%{F#42a5f5}%{F-} Scanning..."
	else
		echo "%{F#42a5f5}%{F-} $device_name"
	fi
fi

