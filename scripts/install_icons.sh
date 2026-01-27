install_icon_packs(){
info "Installing icon packs..."
DIR="$HOME/.icons"; mkdir -p "$DIR"
icons(){ git clone --depth=1 "$2" "/tmp/$1" && bash "/tmp/$1/install.sh" -d "$DIR" || cp -r "/tmp/$1"/* "$DIR"; rm -rf "/tmp/$1"; }
icons Papirus https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
icons Tela https://github.com/vinceliuice/Tela-icon-theme.git
icons WhiteSurIcons https://github.com/vinceliuice/WhiteSur-icon-theme.git
}
