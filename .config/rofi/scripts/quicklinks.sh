#!/usr/bin/env bash

rofi_command="rofi -theme themes/quicklinks.rasi"

# Links
google=""
facebook=""
twitter=""
github=""
reddit=""
youtube=""

# Variable passed to rofi
options="$google\n$facebook\n$twitter\n$github\n$reddit\n$youtube"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  Firefox" -dmenu -selected-row 0)"
case $chosen in
    $google)
        firefox-beta --new-tab https://www.google.com
        ;;
    $facebook)
        firefox-beta --new-tab https://www.facebook.com
        ;;
    $twitter)
        firefox-beta --new-tab https://www.twitter.com
        ;;
    $github)
        firefox-beta --new-tab https://www.github.com
        ;;
    $reddit)
        firefox-beta --new-tab https://www.reddit.com
        ;;
    $youtube)
        firefox-beta --new-tab https://www.youtube.com
        ;;
esac

