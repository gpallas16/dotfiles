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

echo "be sure GRUB_CMDLINE_LINUX_DEFAULT variable, includes nvidia.NVreg_EnableGpuFirmware=0. Then run update-grub"

