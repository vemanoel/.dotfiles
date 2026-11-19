#!/usr/bin/env bash

shopt -s dotglob nullglob

root=$(dirname -- $(realpath -- $0))/root

while IFS=: read -r src dst sudo; do
    for path in $src/*; do
        [[ -e $path || -L $path ]] || continue

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
in sway swaybg jq
in greetd greetd-tuigreet
in firefox
in fuzzel
in mako libnotify
in mpv imv
in grim slurp
in nnn
in foot
in podman podman-compose
in helix make git
in yt-dlp deno ffmpeg
in btop
in pipewire pipewire-pulse wireplumber
in xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr

sudo systemctl enable greetd.service

sudo reboot
