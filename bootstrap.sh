#!/usr/bin/env bash
set -e
REPO_URL="https://github.com/YOURNAME/linux-bootstrap.git"
INSTALL_DIR="$HOME/linux-bootstrap"
echo "Linux Workstation Bootstrap Installer"
if command -v apt >/dev/null 2>&1; then PM="apt"
elif command -v dnf >/dev/null 2>&1; then PM="dnf"
elif command -v pacman >/dev/null 2>&1; then PM="pacman"
else echo "Unsupported system"; exit 1; fi
case "$PM" in
 apt) sudo apt update && sudo apt install -y git curl ;;
 dnf) sudo dnf install -y git curl ;;
 pacman) sudo pacman -Sy --noconfirm git curl ;;
esac
if [ -d "$INSTALL_DIR" ]; then cd "$INSTALL_DIR" && git pull
else git clone "$REPO_URL" "$INSTALL_DIR" && cd "$INSTALL_DIR"; fi
chmod +x install.sh
./install.sh "$@"
