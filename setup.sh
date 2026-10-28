#!/usr/bin/env bash

shopt -s dotglob nullglob

find . -type f \( -name '*.sh' -o -name '*.desktop' \) -exec chmod +x {} +

root=$(dirname -- "$(realpath -- "$0")")/root
while IFS=: read -r dir dst sudo; do
    for src in "$dir"/*; do
        [ -e "$src" ] || [ -L "$src" ] || continue
        $sudo rm -rf -- "$dst/${src##*/}"
        $sudo cp -a -- "$src" "$dst/${src##*/}"
    done
done <<EOF
$root/home/user:$HOME:
$root/etc:/etc:sudo
EOF

sudo dnf clean all
sudo dnf makecache --refresh

sudo dnf install flatpak --setopt=install_weak_deps=False --assumeyes
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install curl --setopt=install_weak_deps=False --assumeyes

sudo dnf install sway --setopt=install_weak_deps=False --assumeyes
sudo dnf install swaybg --setopt=install_weak_deps=False --assumeyes

sudo dnf install greetd --setopt=install_weak_deps=False --assumeyes
sudo dnf install tuigreet --setopt=install_weak_deps=False --assumeyes
sudo systemctl enable greetd.service

sudo dnf install fuzzel --setopt=install_weak_deps=False --assumeyes

sudo dnf install pipewire --setopt=install_weak_deps=False --assumeyes
sudo dnf install wireplumber --setopt=install_weak_deps=False --assumeyes
sudo dnf install pipewire-pulseaudio --setopt=install_weak_deps=False --assumeyes

sudo dnf install imv --setopt=install_weak_deps=False --assumeyes
sudo dnf install mpv --setopt=install_weak_deps=False --assumeyes

sudo dnf install mako --setopt=install_weak_deps=False --assumeyes
sudo dnf install libnotify --setopt=install_weak_deps=False --assumeyes

sudo dnf install grim --setopt=install_weak_deps=False --assumeyes
sudo dnf install slurp --setopt=install_weak_deps=False --assumeyes

sudo dnf install firewalld --setopt=install_weak_deps=False --assumeyes
sudo dnf install NetworkManager --setopt=install_weak_deps=False --assumeyes

sudo dnf install firefox --setopt=install_weak_deps=False --assumeyes

sudo dnf install Thunar --setopt=install_weak_deps=False --assumeyes
sudo dnf install xdg-desktop-portal --setopt=install_weak_deps=False --assumeyes
sudo dnf install xdg-desktop-portal-gtk --setopt=install_weak_deps=False --assumeyes
sudo dnf install xdg-desktop-portal-wlr --setopt=install_weak_deps=False --assumeyes
sudo dnf install gvfs --setopt=install_weak_deps=False --assumeyes
sudo dnf install udisks2 --setopt=install_weak_deps=False --assumeyes

sudo dnf install helix --setopt=install_weak_deps=False --assumeyes
sudo dnf install helix-parsers --setopt=install_weak_deps=False --assumeyes

sudo dnf install git --setopt=install_weak_deps=False --assumeyes

sudo dnf install golang --setopt=install_weak_deps=False --assumeyes
sudo dnf install gopls --setopt=install_weak_deps=False --assumeyes

sudo dnf copr enable peterwu/iosevka --assumeyes
sudo dnf install iosevka-aile-fonts --setopt=install_weak_deps=False --assumeyes
sudo dnf install iosevka-term-fonts --setopt=install_weak_deps=False --assumeyes

sudo dnf install foot --setopt=install_weak_deps=False --assumeyes

sudo dnf install zip --setopt=install_weak_deps=False --assumeyes
sudo dnf install unrar --setopt=install_weak_deps=False --assumeyes
sudo dnf install unzip --setopt=install_weak_deps=False --assumeyes

sudo dnf install yt-dlp --setopt=install_weak_deps=False --assumeyes
sudo dnf copr enable nunodias/deno --assumeyes
sudo dnf install deno --setopt=install_weak_deps=False --assumeyes

sudo dnf install btop --setopt=install_weak_deps=False --assumeyes

flatpak install --user flathub net.ankiweb.Anki --assumeyes

flatpak install --user flathub org.telegram.desktop --assumeyes
flatpak override --user org.telegram.desktop --filesystem=home

sudo reboot
