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

sudo pacman --noconfirm -Syu --needed ttf-jetbrains-mono

sudo pacman --noconfirm -Syu --needed sway
sudo pacman --noconfirm -Syu --needed swaybg

sudo pacman --noconfirm -Syu --needed greetd
sudo pacman --noconfirm -Syu --needed greetd-tuigreet
sudo systemctl enable greetd.service

sudo pacman --noconfirm -Syu --needed pipewire
sudo pacman --noconfirm -Syu --needed pipewire-pulse
sudo pacman --noconfirm -Syu --needed wireplumber

sudo pacman --noconfirm -Syu --needed xdg-desktop-portal
sudo pacman --noconfirm -Syu --needed xdg-desktop-portal-gtk
sudo pacman --noconfirm -Syu --needed xdg-desktop-portal-wlr

sudo pacman --noconfirm -Syu --needed firefox

sudo pacman --noconfirm -Syu --needed fuzzel

sudo pacman --noconfirm -Syu --needed mako
sudo pacman --noconfirm -Syu --needed libnotify

sudo pacman --noconfirm -Syu --needed mpv
sudo pacman --noconfirm -Syu --needed imv

sudo pacman --noconfirm -Syu --needed grim slurp

sudo pacman --noconfirm -Syu --needed foot

# sudo dnf install Thunar --setopt=install_weak_deps=False --assumeyes
# sudo dnf install gvfs --setopt=install_weak_deps=False --assumeyes
# sudo dnf install udisks2 --setopt=install_weak_deps=False --assumeyes

sudo pacman --noconfirm -Syu --needed helix

sudo pacman --noconfirm -Syu --needed git

sudo pacman --noconfirm -Syu --needed podman
sudo pacman --noconfirm -Syu --needed podman-compose

sudo pacman --noconfirm -Syu --needed make

sudo pacman --noconfirm -Syu --needed yt-dlp
sudo pacman --noconfirm -Syu --needed deno
sudo pacman --noconfirm -Syu --needed ffmpeg

sudo pacman --noconfirm -Syu --needed btop

sudo reboot
