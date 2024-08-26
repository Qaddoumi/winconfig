
Write-Host "Upgrading All Programs`n" -ForegroundColor Green
#TODO: upgrade only the apps from WINGET_Programs file
# and check if the app is portable before upgrade and do the proper thing
$installArgs = "upgrade --all --accept-package-agreements --accept-source-agreements --scope=machine"
$process = Start-Process -FilePath "winget" -ArgumentList $installArgs -NoNewWindow -PassThru -Wait
$exitCode = $process.ExitCode
if ($exitCode -eq 0) {
    Write-Host "Done Upgrading Exit code: $($exitCode)" -ForegroundColor Cyan
}
elseif ($exitCode -eq -1978335189) {
    Write-Host "$program No applicable update found" -ForegroundColor Yellow
}
else {
    Write-Host "Failed to upgrade. Exit code: $($exitCode)" -ForegroundColor Yellow
}
