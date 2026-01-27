install_cursor_themes(){
info "Installing cursor themes..."
DIR="$HOME/.icons"; mkdir -p "$DIR"
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-cursors.git /tmp/ws
bash /tmp/ws/install.sh -d "$DIR"
rm -rf /tmp/ws
git clone --depth=1 https://github.com/ful1e5/Bibata_Cursor.git /tmp/bib
cp -r /tmp/bib/Bibata-* "$DIR" || true
rm -rf /tmp/bib
}
