install_desktops(){
TARGET="$1"
info "Installing desktop: $TARGET"
case "$PM" in
 apt)
  [[ "$TARGET" == "gnome" || "$TARGET" == "all" ]] && sudo apt install -y gnome-shell gdm3
  [[ "$TARGET" == "kde" || "$TARGET" == "all" ]] && sudo apt install -y kde-plasma-desktop sddm
  [[ "$TARGET" == "xfce" || "$TARGET" == "all" ]] && sudo apt install -y xfce4 xfce4-goodies lightdm
 ;;
 dnf)
  [[ "$TARGET" == "gnome" || "$TARGET" == "all" ]] && sudo dnf groupinstall -y "GNOME Desktop Environment"
  [[ "$TARGET" == "kde" || "$TARGET" == "all" ]] && sudo dnf groupinstall -y "KDE Plasma Workspaces"
  [[ "$TARGET" == "xfce" || "$TARGET" == "all" ]] && sudo dnf groupinstall -y "Xfce Desktop"
 ;;
 pacman)
  [[ "$TARGET" == "gnome" || "$TARGET" == "all" ]] && sudo pacman -S --noconfirm gnome gdm
  [[ "$TARGET" == "kde" || "$TARGET" == "all" ]] && sudo pacman -S --noconfirm plasma sddm
  [[ "$TARGET" == "xfce" || "$TARGET" == "all" ]] && sudo pacman -S --noconfirm xfce4 lightdm
 ;;
esac
}
