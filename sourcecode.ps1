Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$url = "https://raw.githubusercontent.com/smartestkidwithadhdintheczech/virussource/refs/heads/main/Untitled%20Design.jpg"

$webClient = New-Object System.Net.WebClient
$imageBytes = $webClient.DownloadData($url)
$memoryStream = New-Object System.IO.MemoryStream(,$imageBytes)
$image = [System.Drawing.Image]::FromStream($memoryStream)

$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::Yellow

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Dock = [System.Windows.Forms.DockStyle]::Fill
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom
$pictureBox.Image = $image
$form.Controls.Add($pictureBox)

$form.KeyPreview = $true
$form.Add_KeyDown({
    if ($_.KeyCode -eq [System.Windows.Forms.Keys]::Escape) {
        $form.Close()
    }
})

[void]$form.ShowDialog()
$image.Dispose()
$memoryStream.Dispose()
$webClient.Dispose()
