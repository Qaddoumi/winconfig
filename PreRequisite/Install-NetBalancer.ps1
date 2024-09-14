. "..\Global\Set-Registry.ps1"
function Install-NetBalancer {
    $url = "https://netbalancer.com/downloads/NetBalancerSetup.exe"
    $downloadPath = "$env:TEMP\NetBalancerSetup.exe"
    
    try {
        # Download the setup file
        Write-Host "Downloading NetBalancer setup..."
        Invoke-WebRequest -Uri $url -OutFile $downloadPath
        
        # Install NetBalancer silently with additional options
        Write-Host "Installing NetBalancer..."
        Start-Process -FilePath $downloadPath -ArgumentList "/SILENT", "/SUPPRESSMSGBOXES", "/SP-", "/NORESTART", "/NOCANCEL", "/CLOSEAPPLICATIONS", "/LANG=en" -Wait
        
        # Confirm installation
        Write-Host "NetBalancer installation completed."
        
        # Clean up the setup file
        Remove-Item -Path $downloadPath -Force
        
    } catch {
        Write-Error "Failed to install NetBalancer: $_"
    }
}

function Set-NetBalancerToRunAtLogin {
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
    #TODO: netbalancer settings
    # Settings of the GUI and Tray apps
    # HKEY_CURRENT_USER\Software\SeriousBit\NetBalancer
}

function Show-IconsSysTray {
    $subKeys = Get-ChildItem -Path "HKCU:\Control Panel\NotifyIconSettings"
    Write-Host "Show Icons SysTray For NetBalancer" -ForegroundColor Green
    foreach ($subKey in $subKeys) {
        $values = Get-ItemProperty -Path $subKey.PSPath
        if ($values.ExecutablePath.Contains("NetBalancer")) {
            Set-Registry -Name "IsPromoted" -Path $subKey.PSPath -Type "DWord" -Value 1
        }
    }
}

Install-NetBalancer
Set-NetBalancerToRunAtLogin
Set-NetBalancerSettings
Show-IconsSysTray
