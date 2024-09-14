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

Write-Host "Setting Windhawk registry data" -ForegroundColor Green
. "..\Global\Get-RegData.ps1"
. "..\Global\Set-Registry.ps1"
$windhawkRagData = Get-RegData -Path ".\WindhawkModsSettings\Windhawk.reg"
foreach($regData in $windhawkRagData){
    Set-Registry -Name $regData.Name -Path $regData.Path -Type $regData.Type -Value $regData.Value
}
Write-Host "Modify windhawk userprofile.json"
. ".\WindhawkMods.ps1"
$userProfileJson = Get-Content -Path "$Env:ProgramData\Windhawk\userprofile.json" -Raw
$userProfileJson = $userProfileJson -creplace '(?ms)"mods": {.*?},\s*"os"', $windhawkMods
$userProfileJson | Set-Content -Path "$Env:ProgramData\Windhawk\userprofile.json"


Write-Output "`n================================================================"

Write-Output "`nCoping Settings Files : `n"

. "..\Global\Copy.ps1"

Copy-FileOrFolder -sourcePath ".\WindowsTerminal\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Write-Output "================================================================"
Copy-FileOrFolder -sourcePath ".\PowerShell" -destinationPath "$Env:USERPROFILE\Documents"
Write-Output "================================================================"
Copy-FileOrFolder -sourcePath ".\VSCode\settings.json" -destinationPath "$Env:USERPROFILE\AppData\Roaming\Code\User\settings.json"
Write-Output "================================================================"
Copy-FileOrFolder -sourcePath ".\NetBalancer\netbalancer.json" -destinationPath "$Env:USERPROFILE\Documents\netbalancer.json"
Write-Output "================================================================"
Copy-FileOrFolder -sourcePath ".\Nilesoft Shell" -destinationPath "$Env:ProgramFiles"
Write-Output "================================================================"
Copy-FileOrFolder -sourcePath ".\ProcessMonitor(procmon)\Filter(SetReg).PMF" -destinationPath "$Env:USERPROFILE\Documents\Filter(SetReg).PMF"
Write-Output "================================================================"
Copy-FileOrFolder -sourcePath ".\WindhawkModsSettings\Windhawk" -destinationPath "$Env:ProgramData\"
Write-Output "================================================================"

Start-Process -FilePath "$Env:ProgramFiles\Windhawk\windhawk.exe" -NoNewWindow -ArgumentList "-restart -tray-only" -PassThru -Wait

function Set-NetBalancerToRunAtLogin {
    Write-Host "Set NetBalancer to Run at login" -ForegroundColor Green
    # Define the path to the NetBalancer Tray executable
    $exePath = "%ProgramFiles%\NetBalancer\SeriousBit.NetBalancer.Tray.exe"
    
    # Define the action to run the NetBalancer Tray
    $action = New-ScheduledTaskAction -Execute $exePath
    
    # Define the trigger to run the task at user logon
    $trigger = New-ScheduledTaskTrigger -AtLogon
    
    # Define the principal (user) that will run the task with the highest privileges in the interactive session
    $principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Highest
    
    # Register the scheduled task with the current user and admin rights
    Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "NetBalancer Tray User" -Description "Starts NetBalancer Tray at login with admin rights and interactive session"
}

function Set-NetBalancerSettings {
    Write-Host "Set NetBalancer registry settings for GUI and Tray" -ForegroundColor Green
    $regSettings = @(
        @{ Name   = "MiniFormBlur"
            Type  = "String"
            Value = "False"
        }
        @{ Name   = "Language"
            Type  = "String"
            Value = "English"
        }
        @{ Name   = "ShowBandFormTrayIconOnMouseMove"
            Type  = "String"
            Value = "True"
        }
        @{ Name   = "LightTheme"
            Type  = "String"
            Value = "False"
        }
        @{ Name   = "MiniFormVisible"
            Type  = "String"
            Value = "False"
        }
        @{ Name   = "DeskBandVisible"
            Type  = "String"
            Value = "True"
        }
        @{ Name   = "MiniFormTopMost"
            Type  = "String"
            Value = "False"
        }
    )
    $regSettings = Get-RegData -Path ".\NetBalancer\NetBalancer.reg"
    foreach ($item in $regSettings) {
        Set-Registry -Name $item.Name -Path $item.Path -Type $item.Type -Value $item.Value
    }
}

function Show-IconsSysTray {
    Write-Host "Show Icons SysTray For NetBalancer" -ForegroundColor Green
    $subKeys = Get-ChildItem -Path "HKCU:\Control Panel\NotifyIconSettings"
    foreach ($subKey in $subKeys) {
        $values = Get-ItemProperty -Path $subKey.PSPath
        if ($values.ExecutablePath.Contains("NetBalancer")) {
            Set-Registry -Name "IsPromoted" -Path $subKey.PSPath -Type "DWord" -Value 1
        }
    }
}

Write-Output "================================================================`n"
Set-NetBalancerToRunAtLogin
Set-NetBalancerSettings
Show-IconsSysTray
