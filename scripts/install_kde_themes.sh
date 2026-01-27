install_kde_themes(){
info "Installing KDE global themes..."
DIR="$HOME/.local/share/plasma/look-and-feel"; mkdir -p "$DIR"
git clone --depth=1 https://github.com/vinceliuice/Orchis-kde.git /tmp/ok && cp -r /tmp/ok/* "$DIR" && rm -rf /tmp/ok
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-kde.git /tmp/wk && cp -r /tmp/wk/* "$DIR" && rm -rf /tmp/wk
}
