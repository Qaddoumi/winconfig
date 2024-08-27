Write-Output "`nInstalling required fonts :`n"
& .\InstallFonts.ps1

Write-Output "`n================================================================"

Write-Output "`nChange Default Terminal To Windows Terminal`n"
& .\ChangeDefaultTerminal.ps1

Write-Output "`n================================================================"

# Installing NuGet if using BuildIn powershell
& .\InstallNuGet.ps1

Write-Output "`n================================================================"

Write-Output "`nInstalling PowerShell Modules :"

Write-Output "`nInstalling Terminal-Icons Module"
Install-Module -Name Terminal-Icons -AllowClobber -Force -Repository PSGallery
Write-Output "Installing PSReadLine Module"
Install-Module -Name PSReadLine -AllowClobber -Force -Repository PSGallery
Write-Output "Installing z Module"
Install-Module -Name z -AllowClobber -Force -Repository PSGallery

Write-Output "`nInstalling Modules Finished"

Write-Output "`n================================================================"
# Run to get the extension:
# code --list-extensions > vscode-extensions.txt
Write-Host "Installing VSCode Extension`n" -ForegroundColor Green
. ".\vscode-extensions.ps1"
foreach ($extension in $VSCode_Extensions) {
    try{
        $process = Start-Process code -ArgumentList "--install-extension $extension --force" -Wait -NoNewWindow -PassThru
        if($process.ExitCode -eq 0){
            Write-Host "Installing $extension done successfully, ExitCode : $($process.ExitCode)" -ForegroundColor Cyan
        }
        else{
            Write-Host "Failed installing $extension : ExitCode $($process.ExitCode)" -ForegroundColor Yellow
        }
    }catch{
        Write-Warning "installing error Message : $PSItem"
    }
    Write-Host ""
}

. "..\Global\Get-RegData.ps1"
. "..\Global\Set-Registry.ps1"
$windhawkRagData = Get-RegData -Path ".\WindhawkModsSettings\Windhawk.reg"
foreach($regData in $windhawkRagData){
    Set-Registry -Name $regData.Name -Path $regData.Path -Type $regData.Type -Value $regData.Value
}

$windhawkMods = @"
"mods": {
"no-focus-rectangle": {
"disabled": true,
"latestVersion": "1.0.2",
"version": "1.0.2"
},
"shrink-address-bar-height": {
"disabled": true,
"latestVersion": "1.0.1",
"version": "1.0.1"
},
"taskbar-button-scroll": {
"latestVersion": "1.0.6",
"version": "1.0.6"
},
"taskbar-clock-customization": {
"disabled": false,
"latestVersion": "1.3.3",
"version": "1.3.3"
},
"taskbar-icon-size": {
"latestVersion": "1.2.12",
"version": "1.2.11"
},
"taskbar-notification-icon-spacing": {
"latestVersion": "1.0.2",
"version": "1.0.2"
},
"themed-regedit-listview": {
"latestVersion": "1.0.0",
"version": "1.0.0"
},
"windows-11-start-menu-styler": {
"disabled": true,
"latestVersion": "1.1.5",
"version": "1.1.5"
}
},
"os"
"@
$userProfileJson = (Get-Content -Path "$Env:ProgramData\Windhawk\userprofile.json")
$userProfileJson = $userProfileJson.Replace("`"mods`"*`"os`"", $windhawkMods) | Out-File -FilePath "$Env:ProgramData\Windhawk\userprofile.json"

Start-Process windhawk -NoNewWindow -ArgumentList "-tray-only" -PassThru -Wait

Write-Output "`n================================================================"

Write-Output "`nCoping Settings Files : `n"

. "..\Global\Copy.ps1"

Copy-FileOrFolder -sourcePath ".\WindowsTerminal\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents"
Copy-FileOrFolder -sourcePath ".\VSCode\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
Copy-FileOrFolder -sourcePath ".\Nilesoft Shell" -destinationPath "$Env:ProgramFiles"
Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"

Copy-FileOrFolder -sourcePath ".\WindhawkModsSettings\Windhawk" -destinationPath "$Env:ProgramData\"