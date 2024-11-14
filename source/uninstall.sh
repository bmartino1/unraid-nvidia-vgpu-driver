#!/bin/bash
# uninstall.sh - Script to uninstall NVIDIA vGPU driver and plugin

PLUGIN_PATH="/boot/config/plugins/nvidia-vgpu-driver"
MDVCTL_PATH="/usr/local/bin/mdvctl"

# Step 1: Uninstall NVIDIA driver
echo "Uninstalling NVIDIA vGPU driver..."
removepkg nvidia-vgpu-driver

# Step 2: Remove mdvctl if installed
if [ -f "$MDVCTL_PATH" ]; then
  echo "Removing mdvctl..."
  rm -f "$MDVCTL_PATH"
fi

# Step 3: Remove plugin-related files
echo "Cleaning up plugin files..."
rm -rf "$PLUGIN_PATH"
rm -rf /usr/local/emhttp/plugins/nvidia-vgpu-driver

# Step 4: Remove cron job if exists
crontab -l | grep -v '/usr/local/emhttp/plugins/nvidia-vgpu-driver/include/update-check.sh' | crontab -

echo "NVIDIA vGPU driver uninstalled successfully. Please reboot your server."
