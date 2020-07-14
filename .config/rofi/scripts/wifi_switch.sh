#!/usr/bin/env bash


WaitAPs() {
    while (( $(nmcli -f ssid dev wifi | wc -l) <= 1 )) 
    do
        usleep
    done
}

Connect() {
    result=""

    WaitAPs

    # if password writen
    if [[ ! -z $2 ]]; then
        result=$(nmcli d wifi connect $1 password $2)
    else
        result=$(nmcli d wifi connect $1)
    fi

    echo $result

    if [[ $result == *successfully* ]]; then

        dunstify -a Network "WiFi Connected" "Connected to $1"
        
    elif [[ $result == *activation* ]]; then

        dunstify -a Network "WiFi Auth failed" "Failed to connect $1 \nCan't auth to AP"
        password=$(rofi -dmenu -theme themes/password.rasi -password -p "Insert password")

        if [[ ! -z $password ]]; then
            Connect $1 $password
        fi
    fi
}

rofi_command="rofi -theme themes/wifi_switch.rasi"

MSG="Choose WiFi AP"

active=""

avail_ap_count=0
found_ap_count=0

WaitAPs

current_ap=$(nmcli c show --active | awk '{print $1}' | sed -n 2p)

avail_ap_count=($(nmcli -f ssid dev wifi | wc -l))

while (( $found_ap_count < (($avail_ap_count-1)) ))
do
    options=""
    found_ap_count=0


    for ((i=2; i<$avail_ap_count; i++)) do
    
        next_ap=$(nmcli -f ssid dev wifi | sed -n $((i))p)

        if [[ ! -z $next_ap ]]; then
            found_ap_count+=1

            if [[ $next_ap == *$current_ap* ]]; then
                active="-a $((i-2))"   
            fi
        fi

        options+=$next_ap
        
        if [[ $i -ne $((avail_ap_count-1)) ]]; then
            options+="\n"
        fi

    done
done

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu $active -selected-row 0)"

if [[ ! -z chosen ]]; then
    Connect "$chosen"
fi