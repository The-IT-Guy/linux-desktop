detect_distro(){
. /etc/os-release
case "$ID" in
 ubuntu|debian) PM="apt";;
 fedora|rhel|centos|almalinux|rocky) PM="dnf";;
 arch) PM="pacman";;
 *) die "Unsupported distro: $ID";;
esac
info "Detected $ID (pm=$PM)"
}
