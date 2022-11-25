#!/bin/sh


swayidle -w \
    timeout 300 'sh $HOME/.config/sway/sh/lock.sh' \
    timeout 600 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'sh $HOME/.config/sway/sh/lock.sh'
