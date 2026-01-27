#!/usr/bin/env bash
set -euo pipefail
mkdir -p logs
exec > >(tee -a logs/install.log) 2>&1
DESKTOP="all"
for arg in "$@"; do
 case "$arg" in
  --desktop=gnome) DESKTOP="gnome" ;;
  --desktop=kde) DESKTOP="kde" ;;
  --desktop=xfce) DESKTOP="xfce" ;;
  --desktop=all) DESKTOP="all" ;;
 esac
done
source scripts/helpers.sh
source scripts/detect_distro.sh
source scripts/install_packages.sh
source scripts/install_desktops.sh
source scripts/install_vscode.sh
source scripts/install_jetbrains.sh
source scripts/install_services.sh
source scripts/install_gtk_themes.sh
source scripts/install_icons.sh
source scripts/install_cursors.sh
source scripts/install_kde_themes.sh
source scripts/post_install.sh
detect_distro
require_sudo
install_core_packages
install_desktops "$DESKTOP"
install_vscode
install_jetbrains
install_services
install_gtk_themes
install_icon_packs
install_cursor_themes
install_kde_themes
post_install
echo "BOOTSTRAP COMPLETE ✅"
