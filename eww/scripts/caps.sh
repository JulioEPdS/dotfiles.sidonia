#!/bin/sh
#while inotifywait --event modify /sys/class/leds/input*:capslock/brightness ; do
#    tput clear
#    cat /sys/class/leds/input*:capslock/brightness
#done


watch -t -n 0.5 -d tail  /sys/class/leds/input*:capslock/brightness
