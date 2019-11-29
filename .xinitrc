#!/bin/sh

setxkbmap -option "grp:caps_switch,lv3:ralt_switch,eurosign:5,grp:alt_space_toggle,grp_led:scroll,compose:rwin" -layout "us,ua,ru"
xxkb &

emacs --daemon

/usr/bin/i3
