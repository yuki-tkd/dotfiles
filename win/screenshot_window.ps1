Add-Type -AssemblyName System.Drawing, System.Windows.Forms
$jpegCodec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.FormatDescription -eq "JPEG" }
Start-Sleep -Milliseconds 250

[Windows.Forms.Sendkeys]::SendWait("%{PrtSc}")
Start-Sleep -Milliseconds 250

$bitmap = [Windows.Forms.Clipboard]::GetImage()
$ep = New-Object Drawing.Imaging.EncoderParameters
$ep.Param[0] = New-Object Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]100)

$now = Get-Date -format "yyyy-MM-dd_HH-mm-ss"
$path = "$env:USERPROFILE\Desktop\ScreenShot_${now}.jpg"
$bitmap.Save($path, $jpegCodec, $ep)