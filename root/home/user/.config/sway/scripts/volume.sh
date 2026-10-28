#!/usr/bin/env bash

set -euo pipefail

readonly SINK=@DEFAULT_AUDIO_SINK@
readonly STEP=5%
readonly MAX=0.35

set_volume() {
    case "${1:-}" in
        down)
            wpctl set-volume ${SINK} ${STEP}-
            ;;
        up)
            wpctl set-volume --limit ${MAX} ${SINK} ${STEP}+
            ;;
    esac
}

send_notification() {
    local volume

    volume=$(wpctl get-volume ${SINK})

    if echo ${volume} | grep -q MUTED; then
        volume="MUTED"
    else
        volume="$(echo ${volume} | awk '{print int($2*100)}')%"
    fi

    notify-send --hint string:x-canonical-private-synchronous:volume "volume" ${volume}
}

set_volume "$1"
send_notification
