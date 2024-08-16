Write-Host "Restarting explorer ..." -ForegroundColor Green
Write-Host "Stopping explorer" -ForegroundColor Cyan
Stop-Process -Name explorer -Force
Write-Host "Starting explorer" -ForegroundColor Cyan
Start-Process explorer
Write-Host "Done" -ForegroundColor Cyan