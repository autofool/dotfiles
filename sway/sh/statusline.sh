#!/bin/sh

while true
do

    # -- time
    time=`date "+%H:%M"`

    # -- battery
    bat=`cat /sys/class/power_supply/BAT0/capacity`
    bat_state=`cat /sys/class/power_supply/BAT0/status`

    # -- brightness
    light=`light -G`

    # -- volume
    vol=`pamixer --get-volume-human`

    # -- wifi
    ssid=`iwctl station wlan0 show | awk '/Connected network/{print $3}'`

    # -- output
    printf "%s     BR %.f%%     VOL %s     B%s %s%%     %s" "$ssid" "$light" "$vol" "${bat_state:0:1}" "$bat" "$time"

    # Sleep
    sleep 5
done
