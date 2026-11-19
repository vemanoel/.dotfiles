#!/usr/bin/env bash

shopt -s dotglob nullglob

root=$(dirname -- $(realpath -- $0))/root

while IFS=: read -r src dst sudo; do
    for path in $src/*; do
        [[ -e $path || -L $path" ]] || continue

        target=$dst/${path##*/}
        $sudo rm -rf -- $target
        $sudo cp -a -- $path $target
    
        case "${path##*.}" in
            sh|desktop)
                $sudo chmod +x $target
                ;;
        esac
    done
done <<EOF
$root/home/user:$HOME:
$root/etc:/etc:sudo
EOF

alias in='sudo pacman --noconfirm -Syu --needed'

in ttf-jetbrains-mono

in sway
in swaybg
in jq

in greetd
in greetd-tuigreet
sudo systemctl enable greetd.service

in pipewire
in pipewire-pulse
in wireplumber

in xdg-desktop-portal
in xdg-desktop-portal-gtk
in xdg-desktop-portal-wlr

in firefox

in fuzzel

in mako
in libnotify

in mpv
in imv

in grim
in slurp

in nnn

in foot

in helix

in git

in podman
in podman-compose

in make

in yt-dlp
in deno
in ffmpeg

in btop

sudo reboot
