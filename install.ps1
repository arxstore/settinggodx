# 1. กำหนดชื่อและ Path
$exeName = "SETTING_GODX.exe"
$zipName = "SETTING_GODX.zip"
$tempPath = "$env:TEMP"
$url = "ใส่_Direct_Link_ของ_ไฟล์_ZIP_จาก_Catbox"

# 2. ดาวน์โหลดไฟล์ .zip
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, "$tempPath\$zipName")

# 3. แตกไฟล์ .zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory("$tempPath\$zipName", $tempPath)

# 4. รันโปรแกรมและรอให้ปิด
$process = Start-Process "$tempPath\$exeName" -PassThru
$process.WaitForExit()

# 5. ลบทั้งไฟล์ .exe และ .zip ทิ้งหลังปิดโปรแกรม
Remove-Item "$tempPath\$exeName" -Force
Remove-Item "$tempPath\$zipName" -Force
