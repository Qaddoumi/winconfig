Write-Host "Restarting explorer ..." -ForegroundColor Green
Write-Host "Stopping explorer" -ForegroundColor Cyan
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 2
Write-Host "Starting explorer" -ForegroundColor Cyan
Start-Process explorer.exe -ArgumentList '/n'
Write-Host "Done" -ForegroundColor Green