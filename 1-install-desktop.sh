#!/bin/bash

source "$(dirname "$0")/scripts/library.sh"

packages=(
  "nvidia-settings"
  "nvidia-utils"
  "nvtop"
  "libva-nvidia-driver"
  "libva-utils"
  "libvdpau-va-gl"
  "vdpauinfo"
)

install_packages "${packages[@]}"

