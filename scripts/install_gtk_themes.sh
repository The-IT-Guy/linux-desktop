install_gtk_themes(){
info "Installing GTK themes..."
DIR="$HOME/.themes"; mkdir -p "$DIR"
theme(){ git clone --depth=1 "$2" "/tmp/$1" && bash "/tmp/$1/install.sh" -d "$DIR" || cp -r "/tmp/$1"/* "$DIR"; rm -rf "/tmp/$1"; }
theme Orchis https://github.com/vinceliuice/Orchis-theme.git
theme WhiteSur https://github.com/vinceliuice/WhiteSur-gtk-theme.git
theme Vimix https://github.com/vinceliuice/vimix-gtk-themes.git
theme Qogir https://github.com/vinceliuice/Qogir-theme.git
theme Nordic https://github.com/EliverLara/Nordic.git
theme Sweet https://github.com/EliverLara/Sweet.git
}
