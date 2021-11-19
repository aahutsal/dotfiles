#!/bin/sh

xset r rate 200 60
setxkbmap -model pc105 -layout us,ua,ru -option grp:alt_caps_toggle
xrandr --auto --output DP-1 --auto --primary --output HDMI-1 --auto --left-of DP-1
xxkb &
# /snap/bin/emacs
#emacsclient -c
