install_vscode(){
info "Installing VS Code..."
if has_cmd code; then return; fi
case "$PM" in
 apt)
  curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg >/dev/null
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
  sudo apt update && sudo apt install -y code
 ;;
 dnf)
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo dnf install -y code
 ;;
 pacman)
  sudo pacman -S --noconfirm code
 ;;
esac
}
