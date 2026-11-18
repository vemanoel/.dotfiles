#!/bin/sh

shopt -s dotglob nullglob

find . -type f \( -name '*.sh' -o -name '*.desktop' \) -exec chmod +x {} +

root=$(dirname -- "$(realpath -- "$0")")/root
while IFS=: read -r dir dst sudo; do
    for src in $dir/*; do
        [ -e $src ] || [ -L $src ] || continue
        dst=$dst/${src##*/}
        $sudo rm -rf -- $dst
        $sudo cp -a -- $src $dst
    done
done <<EOF
$root/home/user:$HOME:
$root/etc:/etc:sudo
EOF

sudo dnf clean all
sudo dnf makecache --refresh

sudo pacman --no-comfirm -Syu --needed sway swaybg
sudo pacman --no-comfirm -Syu --needed sway-systemd

sudo pacman --no-comfirm -Syu --needed greetd greetd-tuigreet
sudo systemctl enable greetd.service

sudo pacman --no-comfirm -Syu --needed fuzzel

sudo pacman --no-comfirm -Syu --needed pipewire --setopt=install_weak_deps=False --assumeyes
sudo dnf install wireplumber --setopt=install_weak_deps=False --assumeyes
sudo dnf install pipewire-pulseaudio --setopt=install_weak_deps=False --assumeyes

sudo pacman --no-comfirm -Syu --needed imv mpv

sudo pacman --no-comfirm -Syu --needed mako libnotify

sudo pacman --no-comfirm -Syu --needed grim slurp

sudo dnf install firewalld --setopt=install_weak_deps=False --assumeyes
sudo dnf install NetworkManager --setopt=install_weak_deps=False --assumeyes

sudo dnf install foot --setopt=install_weak_deps=False --assumeyes

sudo dnf install xdg-desktop-portal --setopt=install_weak_deps=False --assumeyes
sudo dnf install xdg-desktop-portal-gtk --setopt=install_weak_deps=False --assumeyes
sudo dnf install xdg-desktop-portal-wlr --setopt=install_weak_deps=False --assumeyes

sudo dnf install Thunar --setopt=install_weak_deps=False --assumeyes
sudo dnf install gvfs --setopt=install_weak_deps=False --assumeyes
sudo dnf install udisks2 --setopt=install_weak_deps=False --assumeyes

sudo dnf install firefox --setopt=install_weak_deps=False --assumeyes

sudo dnf copr enable peterwu/iosevka --assumeyes
sudo dnf install iosevka-aile-fonts --setopt=install_weak_deps=False --assumeyes
sudo dnf install iosevka-term-fonts --setopt=install_weak_deps=False --assumeyes

sudo dnf install helix --setopt=install_weak_deps=False --assumeyes
sudo dnf install helix-parsers --setopt=install_weak_deps=False --assumeyes

sudo pacman --no-comfirm -Syu --needed git

sudo pacman --no-comfirm -Syu --needed podman podman-compose

sudo dnf install make --setopt=install_weak_deps=False --assumeyes

sudo pacman --no-comfirm -Syu --needed  yt-dlp deno ffmpeg

sudo pacman --no-comfirm -Syu --needed btop

sudo dnf upgrade --refresh --assumeyes

sudo reboot
