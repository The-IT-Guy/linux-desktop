detect_distro(){
. /etc/os-release
case "$ID" in
 ubuntu|debian) PM="apt";;
 fedora|rhel|centos|almalinux|rocky) PM="dnf";;
 arch) PM="pacman";;
 *) die "Unsupported distro";;
esac
info "Detected $ID"
}
