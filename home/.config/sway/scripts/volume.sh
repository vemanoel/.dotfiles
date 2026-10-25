#!/usr/bin/env bash

set -euo pipefail

readonly SINK="@DEFAULT_AUDIO_SINK@"
readonly STEP="5%"
readonly MAX_VOLUME="0.5"
readonly NOTIFY_ID="42001"

set_volume() {
    case "${1:-}" in
        up)
            wpctl set-volume -l "$MAX_VOLUME" "$SINK" "${STEP}+"
            ;;
        down)
            wpctl set-volume "$SINK" "${STEP}-"
            ;;
        *)
            echo "Usage: $0 {up|down}" >&2
            exit 1
            ;;
    esac
}

send_notification() {
    local volume

    volume=$(wpctl get-volume "$SINK" | awk '{printf "%.0f%%", $2 * 100}')

    notify-send --hint string:x-canonical-private-synchronous:volume "Volume" $volume
}

set_volume "$1"
send_notification
