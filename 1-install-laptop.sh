#!/bin/bash

source "$(dirname "$0")/scripts/library.sh"

#VDPAU_DRIVER=va-gl vdpauinfo
#Check for persisting this

packages=(
  "libvdpau-va-gl"
  "libva-utils"
  "vdpauinfo"
)

install_packages "${packages[@]}"

