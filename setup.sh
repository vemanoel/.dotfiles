sudo zypper install --no-confirm --no-recommends telegram-desktop

sudo zypper install --no-confirm --no-recommends deno yt-dlp

sudo zypper install --no-confirm --no-recommends git go gopls

sudo zypper install --no-confirm --no-recommends MozillaFirefox

sudo zypper addrepo https://download.opensuse.org/repositories/editors/openSUSE_Tumbleweed/editors.repo
sudo zypper --gpg-auto-import-keys refresh editors
sudo zypper install --no-confirm --no-recommends zed

sudo zypper install --no-confirm --no-recommends flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub net.ankiweb.Anki

sudo zypper install --no-confirm --no-recommends kora-icon-theme
xfconf-query -c xsettings -p /Net/IconThemeName -s "kora"

sudo zypper install --no-confirm --no-recommends breeze-theme-cursors
xfconf-query -c xsettings -p /Gtk/CursorThemeName -n -t string -s "Breeze_Light"
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -n -t int -s 20

sudo zypper install --no-confirm --no-recommends iosevka-fonts
xfconf-query -c xsettings -p /Gtk/FontName -n -t string -s "Iosevka Regular 10"
xfconf-query -c xfwm4 -p /general/title_font -n -t string -s "Iosevka Regular 10"
xfconf-query -c xfce4-terminal -p /font-name -n -t string -s "Iosevka Term 12"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -n -t string -s "Iosevka Term Regular 10"

xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xfwm4 -p /general/theme -s "Greybird-geeko-dark"

xfconf-query -c keyboard-layout -p /Default/XkbDisable -n -t bool -s false
xfconf-query -c keyboard-layout -p /Default/XkbLayout -n -t string -s "us"
xfconf-query -c keyboard-layout -p /Default/XkbVariant -n -t string -s "intl"

xfconf-query -c xfwm4 -p /general/title_alignment -n -t string -s "left"
xfconf-query -c xfwm4 -p /general/button_layout -n -t string -s " |HMC"
xfconf-query -c xfwm4 -p /general/title_font -n -t string -s "Iosevka Regular 10"

xfconf-query -c xfwm4 -p /general/use_compositing -n -t bool -s false

xfconf-query -c xfce4-screensaver -p /lock/enabled -n -t bool -s false
xfconf-query -c xfce4-screensaver -p /saver/enabled -n -t bool -s false

xfconf-query -c xfce4-terminal -p /misc-menubar-default -n -t bool -s false
xfconf-query -c xfce4-terminal -p /misc-default-geometry -n -t string -s "85x20"

xfconf-query -c thunar -p /shortcuts-icon-size -n -t string -s "THUNAR_ICON_SIZE_16"
xfconf-query -c thunar -p /last-view -n -t string -s "ThunarIconView"
xfconf-query -c thunar -p /misc-date-style -n -t string -s "THUNAR_DATE_STYLE_MMDDYYYY"
xfconf-query -c thunar -p /misc-always-enable-split-view -n -t bool -s true
xfconf-query -c thunar -p /last-show-hidden -n -t bool -s true
xfconf-query -c thunar -p /misc-highlighting-enabled -n -t bool -s false
