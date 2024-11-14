#!/bin/bash
# Install NVIDIA driver and mdvctl tool for vGPU

PLUGIN_PATH="/boot/config/plugins/nvidia-vgpu-driver"
NVIDIA_RUN_FILE=$(ls $PLUGIN_PATH/*.run 2>/dev/null)

if [ -z "$NVIDIA_RUN_FILE" ]; then
  echo "Error: NVIDIA .run driver file not found in plugin directory."
  exit 1
fi

echo "Installing NVIDIA driver..."
chmod +x "$NVIDIA_RUN_FILE"
"$NVIDIA_RUN_FILE" --silent --accept-license

if [ $? -ne 0 ]; then
  echo "Error: Failed to install NVIDIA driver."
  exit 1
fi

echo "NVIDIA driver installed successfully."

# Install mdvctl for vGPU
echo "Installing mdvctl..."
# Add your installation steps for mdvctl here (e.g., downloading a binary, extracting it, etc.)

echo "mdvctl installation completed."
