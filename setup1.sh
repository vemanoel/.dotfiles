sudo dnf install helix --setopt=install_weak_deps=False --assumeyes

sudo dnf install git --setopt=install_weak_deps=False --assumeyes

sudo dnf install golang --setopt=install_weak_deps=False --assumeyes
sudo dnf install gopls --setopt=install_weak_deps=False --assumeyes

sudo dnf copr enable peterwu/iosevka --assumeyes
sudo dnf install iosevka-term-fonts --assumeyes
