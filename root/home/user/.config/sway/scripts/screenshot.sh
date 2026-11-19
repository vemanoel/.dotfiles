#!/bin/sh

out=$HOME/Documents/screenshots
file=$(date +%Y%m%d_%H%M%S).png
path=$out/$file

mkdir -p $out

case "$1" in
    area)
        area=$(slurp) || exit 0
        grim -g "$area" $path
        ;;
    *)
        grim $path
        ;;
esac

notify-send -t 3000 "screenshot saved" $path
