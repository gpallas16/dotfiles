#!/bin/bash

source "$(dirname "$0")/scripts/library.sh"

clear
echo "     _       _    __ _ _            "
echo "  __| | ___ | |_ / _(_) | ___  ___  "
echo " / _' |/ _ \| __| |_| | |/ _ \/ __| "
echo "| (_| | (_) | |_|  _| | |  __/\__ \ "
echo " \__,_|\___/ \__|_| |_|_|\___||___/ "
echo "                                    "
echo "-------------------------------------"
echo ""

if [ -d ~/.config ]; then
  echo ".config folder already exists."
else
  mkdir ~/.config
  echo ".config folder created."
fi

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------

# create dirs
mkdir -p "$HOME/.ssh"


# linking
create_symlink "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"
create_symlink "$HOME/dotfiles/git" "$HOME/.config/git"
create_symlink "$HOME/dotfiles/.tool-versions" "$HOME/.tool-versions"
