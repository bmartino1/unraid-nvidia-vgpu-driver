#!/bin/bash
# setup-mdvctl.sh - Script to set up mdvctl for NVIDIA vGPU

PLUGIN_PATH="/boot/config/plugins/nvidia-vgpu-driver"
MDVCTL_PATH="/usr/local/bin/mdvctl"

# Step 1: Check if mdvctl is installed
if [ ! -f "$MDVCTL_PATH" ]; then
  echo "Installing mdvctl..."
  # Assuming mdvctl is distributed as a binary or as a package to install
  wget -O "$PLUGIN_PATH/mdvctl" https://github.com/bmartino1/unraid-nvidia-vgpu-driver/raw/main/source/mdvctl
  chmod +x "$PLUGIN_PATH/mdvctl"
  mv "$PLUGIN_PATH/mdvctl" "$MDVCTL_PATH"
fi

# Step 2: Configure mdvctl
if [ ! -d "/etc/mdvctl" ]; then
  echo "Configuring mdvctl..."
  mkdir -p /etc/mdvctl
  cp "$PLUGIN_PATH/config/default-profile.conf" /etc/mdvctl/default-profile.conf
fi

# Step 3: Setup vGPU profiles
if [ "$1" == "setup-profiles" ]; then
  echo "Setting up default vGPU profiles..."
  $MDVCTL_PATH create-profile --config /etc/mdvctl/default-profile.conf
  echo "Default profiles have been set up."
fi

echo "mdvctl setup completed successfully."
