# Linux Desktop Bootstrap

A one-command installer that sets up a complete developer workstation on Debian/Ubuntu, Fedora/RHEL, or Arch Linux. Installs desktop environments, dev tools, IDEs, a web/database stack, and a curated suite of GTK and KDE themes — all from a single entry point.

---

## Table of Contents

- [What It Installs](#what-it-installs)
- [Supported Distros](#supported-distros)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Modules](#modules)
- [Logging](#logging)
- [Notes](#notes)

---

## What It Installs

### Desktop Environments
- GNOME (gdm3)
- KDE Plasma (sddm)
- XFCE (lightdm)
- Install all three or select one with `--desktop=`

### Developer Tools
git, gcc/g++, make, gdb, vim, neovim, tmux, valgrind, strace, nmap, wireshark, inkscape, gimp, blender, libreoffice, geany, neofetch, fastfetch, curl, wget, unzip

### IDEs
- VS Code (from Microsoft's official repository)
- JetBrains PyCharm Community (Flatpak via Flathub)
- JetBrains WebStorm (Flatpak via Flathub)

### Web & Database Stack
Apache, Nginx, MySQL/MariaDB, PostgreSQL, PHP, phpMyAdmin

### GTK Themes
Orchis · WhiteSur · Vimix · Qogir · Nordic · Sweet → installed to `~/.themes`

### Icon Packs
Papirus · Tela · WhiteSur Icons → installed to `~/.icons`

### Cursor Themes
WhiteSur Cursors · Bibata → installed to `~/.icons`

### KDE Global Themes
Orchis-kde · WhiteSur-kde → installed to `~/.local/share/plasma/look-and-feel`

---

## Supported Distros

| Family              | Distros                                       | Package Manager |
|---------------------|-----------------------------------------------|-----------------|
| Debian / Ubuntu     | Ubuntu, Debian (and derivatives)              | `apt`           |
| Fedora / RHEL       | Fedora, RHEL, CentOS, AlmaLinux, Rocky Linux  | `dnf`           |
| Arch                | Arch Linux (and derivatives)                  | `pacman`        |

---

## Quick Start

Run this from a fresh install — no prerequisites beyond a working internet connection:

```bash
curl -fsSL https://raw.githubusercontent.com/The-IT-Guy/linux-desktop/main/bootstrap.sh | bash
```

`bootstrap.sh` will:
1. Detect your package manager (apt / dnf / pacman)
2. Install `git` and `curl` if missing
3. Clone this repository to `~/linux-desktop`
4. Run `install.sh` with any arguments you passed

### Ubuntu-Only (Self-Contained)

A single-file alternative is available for Ubuntu systems:

```bash
sudo bash ubuntu.sh
```

---

## Usage

If the repo is already cloned:

```bash
# Install everything (all three desktop environments)
./install.sh

# Install only KDE Plasma
./install.sh --desktop=kde

# Install only GNOME
./install.sh --desktop=gnome

# Install only XFCE
./install.sh --desktop=xfce
```

All output is logged to `logs/install.log` in addition to the terminal.

---

## Project Structure

```
linux-desktop/
├── bootstrap.sh          # One-liner entry point: detects PM, clones repo, runs install.sh
├── install.sh            # Orchestrator: sources all modules and runs them in order
├── ubuntu.sh             # Self-contained Ubuntu-only alternative
└── scripts/
    ├── detect_distro.sh  # Sets $PM and $ID based on /etc/os-release
    ├── helpers.sh        # info/warn/die/has_cmd/require_sudo utilities
    ├── install_packages.sh    # Core dev tools and web/DB stack
    ├── install_desktops.sh    # GNOME / KDE / XFCE (selectable)
    ├── install_vscode.sh      # VS Code from Microsoft repo
    ├── install_jetbrains.sh   # PyCharm + WebStorm via Flatpak
    ├── install_services.sh    # Enable and start Apache, Nginx, MySQL, PostgreSQL
    ├── install_gtk_themes.sh  # Clone and install GTK themes to ~/.themes
    ├── install_icons.sh       # Clone and install icon packs to ~/.icons
    ├── install_cursors.sh     # Clone and install cursor themes to ~/.icons
    ├── install_kde_themes.sh  # Clone and install KDE Plasma themes
    └── post_install.sh        # Enable display managers, append fastfetch to .bashrc
```

---

## Modules

Each module is a sourced Bash file exposing a single function. `install.sh` calls them in this order:

| Order | Function               | What it does                                      |
|-------|------------------------|---------------------------------------------------|
| 1     | `detect_distro`        | Identify distro and set `$PM`                     |
| 2     | `require_sudo`         | Validate sudo access before starting              |
| 3     | `install_core_packages`| Dev tools, CLI utilities, and web/DB stack        |
| 4     | `install_desktops`     | Desktop environments (respects `--desktop=` flag) |
| 5     | `install_vscode`       | VS Code (skips if already installed)              |
| 6     | `install_jetbrains`    | PyCharm Community + WebStorm via Flatpak          |
| 7     | `install_services`     | Enable and start web/DB services                  |
| 8     | `install_gtk_themes`   | GTK themes to `~/.themes`                         |
| 9     | `install_icon_packs`   | Icon packs to `~/.icons`                          |
| 10    | `install_cursor_themes`| Cursor themes to `~/.icons`                       |
| 11    | `install_kde_themes`   | KDE global themes                                 |
| 12    | `post_install`         | Enable DMs, add fastfetch to `.bashrc`            |

---

## Logging

All output from `install.sh` is automatically tee'd to `logs/install.log`:

```bash
tail -f logs/install.log
```

---

## Notes

- A reboot is recommended after the installer completes so display managers and services initialize cleanly.
- VS Code installation is idempotent — skipped if `code` is already in PATH.
- Web services (Apache, Nginx, MySQL, PostgreSQL) are enabled to start on boot. Disable any you don't need: `sudo systemctl disable <service>`.
- Theme installation clones repos from GitHub into `/tmp` and removes them after installing — no permanent clones left on disk.
- The `ubuntu.sh` script is a standalone equivalent for Ubuntu; it does not require cloning the repo first.
