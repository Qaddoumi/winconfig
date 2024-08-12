Write-Host "Removing MS Teams" -ForegroundColor Blue

$TeamsPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, "Microsoft", "Teams")
$TeamsUpdateExePath = [System.IO.Path]::Combine($TeamsPath, "Update.exe")

Write-Host "Stopping Teams process..." -ForegroundColor Cyan
Stop-Process -Name "*teams*" -Force -ErrorAction SilentlyContinue

Write-Host "Uninstalling Teams from AppData\Microsoft\Teams" -ForegroundColor Cyan
if ([System.IO.File]::Exists($TeamsUpdateExePath)) {
    # Uninstall app
    Start-Process $TeamsUpdateExePath "-uninstall -s" -NoNewWindow -Wait
}

Write-Host "Removing Teams AppxPackage..." -ForegroundColor Cyan
Get-AppxPackage "*Teams*" | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage "*Teams*" -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

Write-Host "Deleting Teams directory" -ForegroundColor Cyan
if ([System.IO.Directory]::Exists($TeamsPath)) {
    Remove-Item $TeamsPath -Force -Recurse -ErrorAction SilentlyContinue
}

Write-Host "Deleting Teams uninstall registry key" -ForegroundColor Cyan
# Uninstall from Uninstall registry key UninstallString
$us = (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -like "*Teams*" }).UninstallString
if ($us.Length -gt 0) {
    $us = ($us.Replace("/I", "/uninstall ") + " /quiet").Replace("  ", " ")
    $FilePath = ($us.Substring(0, $us.IndexOf(".exe") + 4).Trim())
    $ProcessArgs = ($us.Substring($us.IndexOf(".exe") + 5).Trim().replace("  ", " "))
    Start-Process -FilePath $FilePath -Args $ProcessArgs -NoNewWindow -Wait
}
