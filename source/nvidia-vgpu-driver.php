<?php
// Plugin page header
require_once '/usr/local/emhttp/plugins/dynamix/include/DefaultPageLayout.php';

$plugin = 'nvidia-vgpu-driver';
$plugin_cfg = "/boot/config/plugins/$plugin/settings.cfg";

echo "<h1>NVIDIA vGPU Driver Plugin</h1>";

if ($_POST) {
    // Handle user submissions like uploading the NVIDIA .run file
    if (is_uploaded_file($_FILES['nvidia_driver']['tmp_name'])) {
        $target_path = "/boot/config/plugins/$plugin/" . basename($_FILES['nvidia_driver']['name']);
        if (move_uploaded_file($_FILES['nvidia_driver']['tmp_name'], $target_path)) {
            echo "<p>NVIDIA driver file uploaded successfully.</p>";
        } else {
            echo "<p>Error uploading the driver file.</p>";
        }
    }
}
?>

<form method="post" enctype="multipart/form-data">
    <h2>Upload NVIDIA Driver File (.run)</h2>
    <input type="file" name="nvidia_driver" required />
    <br><br>
    <input type="submit" value="Upload and Install Driver">
</form>
