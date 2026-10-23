sudo dnf install helix --setopt=install_weak_deps=False --assumeyes

sudo dnf install git --setopt=install_weak_deps=False --assumeyes

sudo dnf install golang --setopt=install_weak_deps=False --assumeyes
sudo dnf install gopls --setopt=install_weak_deps=False --assumeyes

sudo dnf copr enable peterwu/iosevka --assumeyes
sudo dnf install iosevka-term-fonts --assumeyes

sudo dnf install yt-dlp --setopt=install_weak_deps=False --assumeyes

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub net.ankiweb.Anki --assumeyes

sudo dnf install htop --setopt=install_weak_deps=False --assumeyes
