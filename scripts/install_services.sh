install_services(){
info "Enabling services..."
sudo systemctl enable --now apache2 httpd || true
sudo systemctl enable --now nginx || true
sudo systemctl enable --now mysql mariadb || true
sudo systemctl enable --now postgresql || true
}
