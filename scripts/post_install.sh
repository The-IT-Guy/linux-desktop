post_install(){
info "Enable display managers..."
sudo systemctl enable --now gdm || true
sudo systemctl enable --now sddm || true
sudo systemctl enable --now lightdm || true
if ! grep -q fastfetch ~/.bashrc; then echo "fastfetch" >> ~/.bashrc; fi
info "Reboot recommended."
}
