Write-Host "Restarting explorer ..." -ForegroundColor Green
Write-Host "Stopping explorer" -ForegroundColor Cyan
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 3
Write-Host "Starting explorer" -ForegroundColor Cyan
Start-Process explorer
Write-Host "Done" -ForegroundColor Green