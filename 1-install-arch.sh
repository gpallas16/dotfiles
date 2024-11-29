#!/bin/bash

source "$(dirname "$0")/scripts/library.sh"

clear
echo "  ___           _        _ _  "
echo " |_ _|_ __  ___| |_ __ _| | | "
echo "  | ||  _ \/ __| __/ _  | | | "
echo "  | || | | \__ \ || (_| | | | "
echo " |___|_| |_|___/\__\__,_|_|_| "
echo "                              "
echo "-------------------------------------"
echo ""

# ------------------------------------------------------
# Paru
# ------------------------------------------------------
if sudo pacman -Qs paru >/dev/null; then
  echo "paru is installed..."
else
  echo "paru is not installed. Will be installed now!"
  git clone https://aur.archlinux.org/paru.git ~/paru
  cd ~/paru || exit
  makepkg -si
  cd ~/dotfiles/ || return
  rm -rf ~/paru
  echo "paru has been installed successfully."
fi

# ------------------------------------------------------
# Install Packages
# ------------------------------------------------------
packages=(
  "git"
  "fwupd"
  "udisks2" # Needed for fwupd
  "wget"
  "curl"
  "bleachbit"
  "openssh"
  "git-delta"
  "unzip" # Needed by asdf
  "genymotion"
  "update-grub"
  "google-chrome"
  "spotify"
  "jetbrains-toolbox"
  "asdf-vm"
  "bash-completion"
  "microsoft-edge-stable-bin"
  "jq"
  "gimp"
  "sshfs"
  "unrar"
  "flameshot"
  "fwupd"
  "viber"
  "pacman-contrib"
)

install_packages "${packages[@]}"

# ------------------------------------------------------
# Add user to wheel
# ------------------------------------------------------
sudoers_line='%wheel ALL=(ALL:ALL) NOPASSWD: ALL'

if sudo grep -q "^${sudoers_line}$" /etc/sudoers; then
  echo "The %wheel group is already uncommented in sudoers."
else
  echo "Uncommenting %wheel group in sudoers..."

  sudo sed -i.bak 's/^#\s*\(%wheel ALL=(ALL:ALL) NOPASSWD: ALL\)/\1/' /etc/sudoers

  if sudo grep -q "^${sudoers_line}$" /etc/sudoers; then
    echo "Success: %wheel group has been uncommented in sudoers."
  else
    echo "Error: Failed to uncomment %wheel group in sudoers."
  fi
fi

sudo usermod -aG wheel "$USER"

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE!"
