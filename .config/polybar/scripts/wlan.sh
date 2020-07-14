#!/bin/sh

ap_name=$(iw dev wlp0s29u1u6 info | grep ssid | awk '{print $2}')

echo "%{F#4caf50} %{F-} $ap_name"
