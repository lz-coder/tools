#!/usr/bin/env bash
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

echo 'user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults' > /etc/dconf/profile/gdm

mkdir -p /etc/dconf/db/gdm.d

echo "[org/gnome/desktop/interface]
accent-color='blue'" > /etc/dconf/db/gdm.d/10-theme

dconf update

