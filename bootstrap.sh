#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/The-IT-Guy/linux-desktop.git"
INSTALL_DIR="$HOME/linux-desktop"

echo "======================================"
echo " Linux Desktop Bootstrap Installer"
echo "======================================"

# ----------------------------
# Detect Package Manager
# ----------------------------
if command -v apt >/dev/null 2>&1; then
  PM="apt"
elif command -v dnf >/dev/null 2>&1; then
  PM="dnf"
elif command -v pacman >/dev/null 2>&1; then
  PM="pacman"
else
  echo "Unsupported system: no apt/dnf/pacman found"
  exit 1
fi

echo "[INFO] Detected package manager: $PM"

# ----------------------------
# Install prerequisites
# ----------------------------
echo "[INFO] Installing git + curl..."

case "$PM" in
  apt)
    sudo apt update
    sudo apt install -y git curl
    ;;
  dnf)
    sudo dnf install -y git curl
    ;;
  pacman)
    sudo pacman -Sy --noconfirm git curl
    ;;
esac

# ----------------------------
# Clone or update repo
# ----------------------------
if [ -d "$INSTALL_DIR" ]; then
  echo "[INFO] Repo exists. Updating..."
  cd "$INSTALL_DIR"
  git pull
else
  echo "[INFO] Cloning repo..."
  git clone "$REPO_URL" "$INSTALL_DIR"
  cd "$INSTALL_DIR"
fi

# ----------------------------
# Run installer
# ----------------------------
chmod +x install.sh scripts/*.sh
./install.sh "$@"
