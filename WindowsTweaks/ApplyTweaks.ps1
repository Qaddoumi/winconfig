. "..\Global\Set-Registry.ps1"

function Set-ServiceStartupType {
    <#
    .SYNOPSIS
        Changes the startup type of the given service
    .EXAMPLE
        Set-ServiceStartupType -Name "HomeGroupListener" -StartupType "Manual" -OriginalType "Automatic"
    #>
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Automatic", "Manual", "Disabled", "AutomaticDelayedStart")]
        [string]$StartupType,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Automatic", "Manual", "Disabled", "AutomaticDelayedStart")]
        [string]$OriginalType
    )
    try {
        $service = Get-Service -Name $Name -ErrorAction Stop
        if(!($service.StartType.ToString() -eq $OriginalType)) {
            Write-Host "Service $($service.Name) was changed in the past to $($service.StartType.ToString()) from it's original type of $OriginalType, will not change it to $StartupType" -ForegroundColor Cyan
        }
        else{
            Write-Host "$Name and state is $($service.StartType.ToString())" -ForegroundColor Cyan
            # Service exists, proceed with changing properties
            $service | Set-Service -StartupType $StartupType -ErrorAction Stop
        }
    }
    catch [Microsoft.PowerShell.Commands.ServiceCommandException] {
        Write-Warning "Service '$Name' was not found."
    }
    catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $PSItem.Exception.Message
    }
}
function Show-IconsSysTray{
    $registryPath = "HKCU:\Control Panel\NotifyIconSettings"
    $subKeys = Get-ChildItem -Path $registryPath
    $Name = "IsPromoted"
    $Enable = 1
    Write-Host "Show Icons SysTray" -ForegroundColor Green
    foreach ($subKey in $subKeys) {
        # Check for specific values in the subkey that might identify "Safely Remove Hardware"
        $values = Get-ItemProperty -Path $subKey.PSPath
        #Write-Host $values
        if ($values.IconGuid -eq "{7820AE78-23E3-4229-82C1-E41CB67D5B9C}" -and $values.ExecutablePath -eq "{F38BF404-1D43-42F2-9305-67DE0B28FC23}\explorer.exe" ){
            #Write-Host "FOUND IT" -ForegroundColor Green
            $Enable = 1
        }
        else{
            $Enable = 0
        }
        Set-Registry -Name $Name -Path $subKey.PSPath -Type "DWord" -Value $Enable
    }
}
function Disable-PowershellTelemetry{
    # This will create an Environment Variable called &#39;POWERSHELL_TELEMETRY_OPTOUT&#39; with a value of &#39;1&#39; which will tell Powershell 7 to not send Telemetry Data
    Write-Host "Disable Powershell 7 Telemetry" -ForegroundColor Green
    Write-Host "Setting Env `"POWERSHELL_TELEMETRY_OPTOUT`" To `"1`"" -ForegroundColor Cyan
    [Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT", "1", "Machine")
    # Undo
    # [Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT", "", "Machine")
}
function Remove-HomeGallery{
    Write-Host "Remove Home and Gallery from explorer" -ForegroundColor Green
    Write-Host "Removes the Home and Gallery from explorer and sets This PC as default" -ForegroundColor Cyan
    # Delete the first registry key
    Try {
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Force -Recurse -ErrorAction SilentlyContinue
    }
    Catch {
        Write-Warning "Failed to remove the specified registry key"
        Write-Warning $PSItem.Exception.Message
    }
    # Delete the second registry key
    Try {
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -Force -Recurse -ErrorAction SilentlyContinue
    }
    Catch {
        Write-Warning "Failed to remove the specified registry key"
        Write-Warning $PSItem.Exception.Message
    }
    <#
    UndoScript =
    # Add the first registry key with a default value
    Set-Registry -Name "(Default)" -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Type "String" -Value "{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}"
    # Add the second registry key with a default value
    Set-Registry -Name "(Default)" -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -Type "String" -Value "CLSID_MSGraphHomeFolder"
    #>
}

Write-Host "`n================================================================" -NoNewline
. ".\RegistrySettings.ps1"
foreach($Setting in $RegistrySettings){
    Write-Host "`n================================================================"
    Write-Host $Setting.Message -ForegroundColor Green
    foreach($Entry in $Setting.Data){
        Set-Registry -Name $Entry.Name -Path $Entry.Path -Type $Entry.Type -Value $Entry.Value
    }
}

Write-Host "`n================================================================"
Show-IconsSysTray

Write-Host "`n================================================================"
. ".\StartMenuPinsConfig.ps1"

Write-Host "`n================================================================"
Disable-PowershellTelemetry

Write-Host "`n================================================================"
Remove-HomeGallery

Write-Host "`n================================================================"
# Source the variable definition script (List of Services Collection)
. ".\ServicesCollection.ps1"
Write-Host $ServicesCollection.Description -ForegroundColor Green
foreach($service in $ServicesCollection.service){
    Write-Host "`n================================================================"
    Set-ServiceStartupType -Name $service.Name -StartupType $service.StartupType -OriginalType $service.OriginalType
}

# Write-Host "`n================================================================"
# Source the variable definition script (List of reg,sch,and function)
# . ".\DisableTelemetry.ps1"

Write-Host "`n================================================================" -ForegroundColor DarkYellow
. "..\Global\TimeoutInput.ps1"

$userInput = TimeoutInput -Prompt "Do you want to reboot recommended? ``(y/N``) :" -TimeoutSeconds 5 -DefaultValue "N"

if ($userInput -eq 'y' -or $userInput -eq 'yes') {
    # Reboot the system
    Write-Host "choice is $userInput" -ForegroundColor Green
    Restart-Computer -Force
}