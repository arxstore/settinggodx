# 1. กำหนดตำแหน่งที่จะเซฟไฟล์ชั่วคราว (โฟลเดอร์ Temp ของ Windows)
$BatFilePath = "$env:TEMP\Setting GodX.bat"

# 2. URL ของไฟล์ Setting GodX.bat จาก GitHub
$GithubUrl = "https://raw.githubusercontent.com/arxstore/settinggodx/refs/heads/main/Setting%20GodX.bat"

# 3. ดาวน์โหลดไฟล์จาก GitHub มาเซฟลงเครื่อง
Write-Host "Downloading Setting GodX.bat..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $GithubUrl -OutFile $BatFilePath

# 4. สั่งรันไฟล์ (ใช้ "" ครอบตัวแปรเพื่อป้องกันปัญหาชื่อไฟล์เว้นวรรค)
Write-Host "Running Setting GodX.bat..." -ForegroundColor Green
& "$BatFilePath"

# 5. (ทางเลือก) ลบไฟล์ทิ้งหลังจากรันเสร็จเพื่อไม่ให้รกเครื่อง
Remove-Item -Path $BatFilePath -Force
Write-Host "Process Completed!" -ForegroundColor Yellow