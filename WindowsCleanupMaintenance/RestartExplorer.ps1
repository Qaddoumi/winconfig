Write-Host "Restarting explorer ..." -ForegroundColor Green
Write-Host "Stopping explorer" -ForegroundColor Cyan
taskkill /f /im explorer.exe
Write-Host "Starting explorer" -ForegroundColor Cyan
Start-Process explorer.exe
Start-Sleep -Seconds 5
Write-Host "Done" -ForegroundColor Green