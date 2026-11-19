#!/bin/sh

find . -type f \( -name '*.sh' -o -name '*.desktop' \) -exec chmod +x {} +

root=$(dirname -- "$(realpath -- "$0")")/root

while IFS=: read -r src dst sudo; do
    find $src -mindepth 1 -maxdepth 1 -exec sh -ec '
        for src do
            dst=$dst/${src##*/}
            $sudo rm -rf -- $dst
            $sudo cp -a -- $src $dst
        done
    ' {} +
done <<EOF
$root/home/user:$HOME:
$root/etc:/etc:sudo
EOF

alias in='sudo pacman --noconfirm -Syu --needed'

in ttf-jetbrains-mono

in sway
in swaybg

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
