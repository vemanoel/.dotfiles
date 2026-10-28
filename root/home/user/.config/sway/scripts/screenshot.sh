#!/usr/bin/env bash

set -euo pipefail

readonly OUTDIR="$HOME/Documents/screenshots"
readonly FILENAME="$(date +%Y%m%d_%H%M%S).png"
readonly FILEPATH="$OUTDIR/$FILENAME"

mkdir -p $OUTDIR

case "${1:-}" in
    area)
        area=$(slurp) || exit 0
        grim -g "$area" "$FILEPATH"
        ;;
    *)
        grim "$FILEPATH"
        ;;
esac

notify-send -t 2000 "Screenshot Saved" "$FILEPATH"
