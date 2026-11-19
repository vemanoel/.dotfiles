#!/usr/bin/env bash

path=$1

case ${path##*.} in
    jpg|jpeg|png|gif|heic|svg|avif|heif|webp|bmp|tiff|tif|avif)
        swayimg $path &
        ;;
    mp4|mkv|webm|avi|mov|flv|wmv|m4v|mpeg|ogg|wav|wave|mpg)
        mpv $path &
        ;;
    *)
        helix $path
        ;;
esac
