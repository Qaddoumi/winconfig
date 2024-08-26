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
$windhawkRagData = Get-RegData -Path ".\Windhawk\Windhawk.reg"
foreach($regData in $windhawkRagData){
    Set-Registry -Name $regData.Name -Path $regData.Path -Type $regData.Type -Value $regData.Value
}
#TODO: copy windhawk other files
Start-Process windhawk -NoNewWindow -ArgumentList "-tray-only" -PassThru -Wait

Write-Output "`n================================================================"

Write-Output "`nCoping Settings Files : `n"

. "..\Global\Copy.ps1"

Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents"
Copy-FileOrFolder -sourcePath ".\WindowsTerminal\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-FileOrFolder -sourcePath ".\VSCode\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
$items = Get-ChildItem -Path ".\Shell" | ForEach-Object { $PSItem.Name.Trim() }
foreach ($item in $items) {
    if ($item.Contains(".nss")) { Copy-FileOrFolder -sourcePath ".\Shell\$item" -destinationPath "$Env:ProgramFiles\Nilesoft Shell\$item" }
    else { Copy-FileOrFolder -sourcePath ".\Shell\$item" -destinationPath "$Env:ProgramFiles\Nilesoft Shell" }
}
Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"
