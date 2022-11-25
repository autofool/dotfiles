#!/bin/sh

ring_radius="20"
col_black="000000"
col_gray="222222"
col_blue="0055aa"
col_cyan="002222"
col_red="220000"

swaylock -L -n -f \
    -c $col_black \
    --indicator-radius $ring_radius \
    --key-hl-color $col_blue \
    --bs-hl-color $col_black \
    --indicator-thickness 6 \
    --inside-color $col_black \
    --inside-clear-color $col_black \
    --inside-ver-color $col_black \
    --inside-wrong-color $col_black \
    --separator-color $col_gray \
    --ring-color $col_gray \
    --ring-clear-color $col_gray \
    --ring-ver-color $col_cyan \
    --ring-wrong-color $col_red \
