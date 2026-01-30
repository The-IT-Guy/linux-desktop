#!/usr/bin/env bash
set -e

echo "======================================"
echo " UBUNTU FULL DEV DESKTOP BOOTSTRAP"
echo "======================================"

# STEP 1: Update system
sudo apt update && sudo apt upgrade -y

# STEP 2: Core developer + workstation packages
sudo apt install -y \
git curl wget unzip zip \
build-essential gcc g++ make gdb \
vim neovim tmux \
valgrind strace linux-tools-common linux-tools-generic \
neofetch \
nmap wireshark \
libreoffice \
gnome-terminal gnome-tweaks \
sassc optipng \
geany kdevelop \
inkscape gimp blender \
gtk2-engines-murrine

# STEP 3: Install Desktop Environments
sudo apt install -y \
gnome-shell gdm3 \
kde-plasma-desktop sddm \
xfce4 xfce4-goodies lightdm

# Enable GNOME display manager
sudo systemctl enable --now gdm3

# STEP 4: Install VS Code (Official Microsoft Repo)
sudo apt install -y apt-transport-https ca-certificates gnupg

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor \
| sudo tee /usr/share/keyrings/vscode.gpg >/dev/null

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] \
https://packages.microsoft.com/repos/code stable main" \
| sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt install -y code

# STEP 5: JetBrains IDEs via Flatpak
sudo apt install -y flatpak

sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install -y flathub \
com.jetbrains.PyCharm-Community \
com.jetbrains.WebStorm

# STEP 6: Web + Database Stack
sudo apt install -y \
apache2 nginx \
mysql-server \
postgresql \
php php-cli php-fpm \
phpmyadmin

sudo systemctl enable --now apache2
sudo systemctl enable --now nginx
sudo systemctl enable --now mysql
sudo systemctl enable --now postgresql

# STEP 7: Themes + Icons + Cursor Packs
mkdir -p ~/.themes ~/.icons
cd /tmp

install_theme () {
  NAME="$1"
  REPO="$2"

  rm -rf "$NAME"
  git clone --depth=1 "$REPO" "$NAME"

  if [[ -f "$NAME/install.sh" ]]; then
    bash "$NAME/install.sh" -d ~/.themes
  else
    cp -r "$NAME"/* ~/.themes
  fi

  rm -rf "$NAME"
}

install_icons () {
  NAME="$1"
  REPO="$2"

  rm -rf "$NAME"
  git clone --depth=1 "$REPO" "$NAME"

  if [[ -f "$NAME/install.sh" ]]; then
    bash "$NAME/install.sh" -d ~/.icons
  else
    cp -r "$NAME"/* ~/.icons
  fi

  rm -rf "$NAME"
}

# GTK Themes
install_theme Orchis   https://github.com/vinceliuice/Orchis-theme.git
install_theme WhiteSur https://github.com/vinceliuice/WhiteSur-gtk-theme.git
install_theme Vimix    https://github.com/vinceliuice/vimix-gtk-themes.git
install_theme Qogir    https://github.com/vinceliuice/Qogir-theme.git
install_theme Nordic   https://github.com/EliverLara/Nordic.git
install_theme Sweet    https://github.com/EliverLara/Sweet.git

# Icon Packs
sudo apt install -y papirus-icon-theme
install_icons Tela     https://github.com/vinceliuice/Tela-icon-theme.git
install_icons WhiteSur https://github.com/vinceliuice/WhiteSur-icon-theme.git

# Cursor Themes
sudo apt install -y bibata-cursor-theme

git clone --depth=1 https://github.com/vinceliuice/WhiteSur-cursors.git
cd WhiteSur-cursors
./install.sh -d ~/.icons
cd /tmp
rm -rf WhiteSur-cursors

# STEP 8: KDE Global Themes
mkdir -p ~/.local/share/plasma/look-and-feel

git clone --depth=1 https://github.com/vinceliuice/Orchis-kde.git
cp -r Orchis-kde/* ~/.local/share/plasma/look-and-feel/
rm -rf Orchis-kde

git clone --depth=1 https://github.com/vinceliuice/WhiteSur-kde.git
cp -r WhiteSur-kde/* ~/.local/share/plasma/look-and-feel/
rm -rf WhiteSur-kde

# STEP 9: Auto Apply GNOME Theme
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark" || true
gs
