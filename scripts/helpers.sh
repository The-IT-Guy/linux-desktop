info(){ echo "[INFO] $*"; }
warn(){ echo "[WARN] $*"; }
die(){ echo "[ERROR] $*"; exit 1; }
has_cmd(){ command -v "$1" >/dev/null 2>&1; }
require_sudo(){ sudo -v || die "sudo required"; }
