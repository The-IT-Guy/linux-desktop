install_jetbrains(){
info "Installing JetBrains IDEs..."
if ! has_cmd flatpak; then
 case "$PM" in
  apt) sudo apt install -y flatpak ;;
  dnf) sudo dnf install -y flatpak ;;
  pacman) sudo pacman -S --noconfirm flatpak ;;
 esac
fi
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.jetbrains.PyCharm-Community com.jetbrains.WebStorm
}
