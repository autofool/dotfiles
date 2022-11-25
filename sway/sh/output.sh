#!/bin/sh


hdmi_state="$(find /sys/class/drm/card0/*HDMI*/status 2> /dev/null)"
mon_edp="$(swaymsg -p -t get_outputs | awk '/eDP/{print $2}')"


if [[ -n $hdmi_state && -n $mon_edp && "$(cat $hdmi_state)" == "connected" ]]
then
    swaymsg output "$mon_edp" disable
fi
