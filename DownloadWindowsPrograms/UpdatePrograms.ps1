
Write-Host "Upgrading All Programs`n" -ForegroundColor Green

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
