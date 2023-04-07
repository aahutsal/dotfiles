#!/bin/sh

export TERMINAL=urxvtc
xset r rate 200 60
setxkbmap -option "grp:caps_switch,lv3:ralt_switch,eurosign:5,grp:alt_space_toggle,grp_led:scroll,compose:rwin" -layout "us,ua,ru"
xrandr --auto --output DP1 --auto --primary --output HDMI1 --auto --left-of DP1
xxkb &
xset -dpms
# /snap/bin/emacs
#emacsclient -c
