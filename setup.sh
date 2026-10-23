flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install curl --setopt=install_weak_deps=False --assumeyes

sudo dnf install sway --setopt=install_weak_deps=False --assumeyes

sudo dnf install dunst libnotify --setopt=install_weak_deps=False --assumeyes

sudo dnf install grim slurp --setopt=install_weak_deps=False --assumeyes

sudo dnf install rofi --setopt=install_weak_deps=False --assumeyes

sudo dnf install Thunar --setopt=install_weak_deps=False --assumeye

sudo dnf install firefox --setopt=install_weak_deps=False --assumeyes

sudo dnf install helix --setopt=install_weak_deps=False --assumeyes

sudo dnf install git --setopt=install_weak_deps=False --assumeyes

sudo dnf install golang --setopt=install_weak_deps=False --assumeyes
sudo dnf install gopls --setopt=install_weak_deps=False --assumeyes

sudo dnf copr enable peterwu/iosevka --assumeyes
sudo dnf install iosevka-term-fonts --assumeyes

sudo dnf install alacritty --setopt=install_weak_deps=False --assumeyes

sudo dnf install yt-dlp --setopt=install_weak_deps=False --assumeyes

sudo dnf install btop --setopt=install_weak_deps=False --assumeyes

flatpak install --user flathub net.ankiweb.Anki --assumeyes

flatpak install --user flathub org.telegram.desktop --assumeyes

rm -rf $HOME/.config
mv .config $HOME
