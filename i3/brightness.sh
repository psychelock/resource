#!/usr/bin/env bash

BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
MAX_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/max_brightness)
ONE_LEVEL=$(( ${MAX_BRIGHTNESS} / 15 ))

if [ $1 = "up" ]; then
    NEW_BRIGHTNESS=$(( ${BRIGHTNESS} + ${ONE_LEVEL} ))
    if [ ${NEW_BRIGHTNESS} -gt ${MAX_BRIGHTNESS} ]; then
        NEW_BRIGHTNESS=${MAX_BRIGHTNESS}
    fi
    echo ${NEW_BRIGHTNESS} > /sys/class/backlight/intel_backlight/brightness
    exit 0
fi

if [ $1 = "down" ]; then
    NEW_BRIGHTNESS=$(( ${BRIGHTNESS} - ${ONE_LEVEL} ))
    if [ ${NEW_BRIGHTNESS} -lt 0 ]; then
        NEW_BRIGHTNESS=2
    fi
    echo ${NEW_BRIGHTNESS} > /sys/class/backlight/intel_backlight/brightness
    exit 0
fi

exit 1
