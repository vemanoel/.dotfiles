#!/bin/sh

shopt -s dotglob nullglob

find . -type f \( -name '*.sh' -o -name '*.desktop' \) -exec chmod +x {} +

root=$(dirname -- "$(realpath -- "$0")")/root
while IFS=: read -r dir dst sudo; do
    for src in $dir/*; do
        [ -e $src ] || [ -L $src ] || continue
        target=$dst/${src##*/}
        $sudo rm -rf -- $target
        $sudo cp -a -- $src $target
    done
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
