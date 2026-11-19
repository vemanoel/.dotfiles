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

sudo pacman --noconfirm -Syu --needed sway swaybg

sudo pacman --noconfirm -Syu --needed greetd greetd-tuigreet
sudo systemctl enable greetd.service

sudo pacman --noconfirm -Syu --needed fuzzel

sudo pacman --noconfirm -Syu --needed pipewire pipewire-pulse wireplumber

sudo pacman --noconfirm -Syu --needed imv mpv

sudo pacman --noconfirm -Syu --needed mako libnotify

sudo pacman --noconfirm -Syu --needed grim slurp

sudo pacman --noconfirm -Syu --needed firefox

sudo dnf install foot --setopt=install_weak_deps=False --assumeyes

# sudo dnf install xdg-desktop-portal --setopt=install_weak_deps=False --assumeyes
# sudo dnf install xdg-desktop-portal-gtk --setopt=install_weak_deps=False --assumeyes
# sudo dnf install xdg-desktop-portal-wlr --setopt=install_weak_deps=False --assumeyes

# sudo dnf install Thunar --setopt=install_weak_deps=False --assumeyes
# sudo dnf install gvfs --setopt=install_weak_deps=False --assumeyes
# sudo dnf install udisks2 --setopt=install_weak_deps=False --assumeyes

sudo pacman --noconfirm -Syu --needed helix

sudo pacman --noconfirm -Syu --needed ttf-jetbrains-mono

sudo pacman --noconfirm -Syu --needed git

sudo pacman --noconfirm -Syu --needed podman podman-compose

sudo pacman --noconfirm -Syu --needed make

sudo pacman --noconfirm -Syu --needed yt-dlp deno ffmpeg

sudo pacman --noconfirm -Syu --needed btop

sudo reboot
