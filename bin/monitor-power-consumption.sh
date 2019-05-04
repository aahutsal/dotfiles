#!/bin/sh
file=$1 || '~/Desktop/power-consumption.txt'
while true; do sudo upower -i /org/freedesktop/UPower/devices/battery_BAT0 >> $file; uptime >> $file; sleep 60; done
