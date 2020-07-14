#!/bin/bash
CITY_ID=""
API_ID=""

REQUEST=$(curl -s https://api.openweathermap.org/data/2.5/weather\?id=${CITY_ID}\&appid=${API_ID}\&units=metric)

CUR_TEMP=$(echo ${REQUEST} | jq -r '.main .temp')
CUR_WEATHER=$(echo ${REQUEST} | jq -r '.weather[0] .main')
CUR_ICON=$(echo ${REQUEST} | jq -r '.weather[0] .icon')

OUTPUT=""

case $CUR_ICON in
	#Day
	"01d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"02d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"03d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"04d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"09d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"10d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"11d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"13d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"50d")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	#Night	
	"01n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"02n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"03n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"04n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"09n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"10n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"11n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"13n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	"50n")
		OUTPUT+="%{F#5294e2}%{F-} ";;
	
esac

OUTPUT+="$CUR_WEATHER $CUR_TEMP"
		
echo $OUTPUT
