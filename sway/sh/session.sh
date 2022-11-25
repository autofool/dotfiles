#!/bin/sh

read -d '' entries << EOL
Lockscreen
Logout
Shutdown
Reboot
EOL

echo -e "$entries" | bemenu -snibcf -W 0.25 -l 20 -H 24 \
    --fn "Fira Sans 10" \
    -p "" -P "" \
    --ch 16 --cw 2 \
    --tb "#ffffff" --tf "#444444" \
    --fb "#ffffff" --ff "#444444" \
    --nb "#dddddd" --nf "#444444" \
    --hb "#2288aa" --hf "#ffffff" \
    --fbb "#2288aa" --fbf "#ffffff" \
    --sb "#2288aa" --sf "#ffffff" \
    --ab "#ffffff" --af "#444444" \
    -B 3 --bdr "#2288aa" | {
    read result
    case $result in
        "Lockscreen") sh $HOME/.config/sway/sh/lock.sh ;;
        "Logout") swaymsg exit ;;
        "Shutdown") shutdown now ;;
        "Reboot") shutdown -r now ;;
    esac
}
