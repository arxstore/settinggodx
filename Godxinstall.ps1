$tempBat = Join-Path $env:TEMP "Setting GodX.bat"

$batUrl = "https://raw.githubusercontent.com/arxstore/settinggodx/refs/heads/main/Setting%20GodX.bat"

Invoke-WebRequest -Uri $batUrl -OutFile $tempBat

Start-Process -FilePath $tempBat -Wait

Remove-Item -Path $tempBat -Force -ErrorAction SilentlyContinue
