#!/bin/bash

weather_data=$(curl -s wttr.in/$location)

if [[ $? -eq 0 ]]; then

  city=$(echo "$weather_data" | head -n 1)

  weather_temp=$(echo "$weather_data" | grep -Eo '[^ ]+ [^ ]+°C')

  if [[ -n "$weather_temp" ]]; then
   
    weather=$(echo "$weather_temp" | cut -d ' ' -f 1)
    temperature=$(echo "$weather_temp" | cut -d ' ' -f 2)

  
    echo "Weather in $city: $weather, $temperature°C"
  else
    echo "Error: Could not extract weather data."
  fi
else
  echo "Error: Could not retrieve weather data."
fi
