install_core_packages(){
info "Installing packages..."
case "$PM" in
 apt)
  sudo apt update
  sudo apt install -y git gcc g++ make gdb vim neovim tmux valgrind strace nmap wireshark inkscape gimp blender libreoffice geany neofetch fastfetch curl wget unzip zip gnome-terminal gnome-tweaks gtk2-engines-murrine sassc optipng apache2 nginx php php-cli php-fpm mysql-server postgresql phpmyadmin
 ;;
 dnf)
  sudo dnf install -y git gcc gcc-c++ make gdb vim-enhanced neovim tmux valgrind strace nmap wireshark inkscape gimp blender libreoffice geany neofetch fastfetch curl wget unzip zip gnome-terminal gnome-tweaks gtk-murrine-engine sassc optipng httpd nginx php php-cli php-fpm mariadb-server postgresql-server phpMyAdmin
 ;;
 pacman)
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm git gcc make gdb vim neovim tmux valgrind strace nmap wireshark-qt inkscape gimp blender libreoffice-fresh geany neofetch fastfetch curl wget unzip zip gnome-terminal gnome-tweaks gtk-engine-murrine sassc optipng apache nginx php mariadb postgresql phpmyadmin
 ;;
esac
}
