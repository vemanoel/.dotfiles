#!/usr/bin/env bash

sink=@DEFAULT_AUDIO_SINK@
step=5%
max=0.35

case "$1" in
    mute)
        wpctl set-mute $sink toggle
        ;;
    decrease)
        wpctl set-volume $sink $step-
        ;;
    increase)
        wpctl set-volume -l $max $sink $step+
        ;;
esac

volume=$(wpctl get-volume $sink)

if echo $volume | grep -q MUTED; then
    msg="MUTED"
else
    msg="$(echo $volume | awk '{print int($2*100)}')%"
fi

notify-send -h string:x-canonical-private-synchronous:volume "volume" $msg
