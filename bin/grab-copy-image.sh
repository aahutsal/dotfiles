#!/bin/sh
F=~/screenshots/today/screenshot_$(date +%F-%T).png
import ${F}
xclip -selection clipboard -t image/png -i ${F}
