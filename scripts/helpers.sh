info(){ echo "[INFO] $*"; }
die(){ echo "[ERROR] $*"; exit 1; }
require_sudo(){ sudo -v || die "sudo required"; }
