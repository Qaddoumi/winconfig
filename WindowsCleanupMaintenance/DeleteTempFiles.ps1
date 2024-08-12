Try{
    # Erases TEMP Folders
    Write-Host "Delete Temporary Files" -ForegroundColor Green
    Get-ChildItem -Path "C:\Windows\Temp" *.* -Recurse | Remove-Item -Force -Recurse
    Get-ChildItem -Path $env:TEMP *.* -Recurse | Remove-Item -Force -Recurse
}
Catch{
    Write-Warning "Unable to Delete Temporary Files due to unhandled exception"
    Write-Warning $psitem.Exception.StackTrace
}
Try{
    Write-Host "Run Disk Cleanup" -ForegroundColor Green
    Write-Host "Runs Disk Cleanup on Drive C: and removes old Windows Updates" -ForegroundColor Cyan
    cleanmgr.exe /d C: /VERYLOWDISK
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}
Catch{
    Write-Warning "Unable to Run Disk Cleanup due to unhandled exception"
    Write-Warning $psitem.Exception.StackTrace
}
