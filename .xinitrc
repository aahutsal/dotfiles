#!/bin/sh

XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

xset rate r 200 25
setxkbmap -option "grp:caps_switch,lv3:ralt_switch,eurosign:5,grp:alt_space_toggle,grp_led:scroll,compose:rwin" -layout "us,ua,ru"
xxkb &

