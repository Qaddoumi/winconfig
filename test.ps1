[CmdletBinding()]
param (
    [string]$ScriptLocation = ""
)
if ($ScriptLocation) {
    Set-Location $ScriptLocation
}
#region Run As Admin
# Check for admin privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "================================================================`n" -Foregroundcolor Red
    Write-Host "Run the script with Admin rights`n" -Foregroundcolor Red
    Write-Host "Change Execution Policy by running : `n" -Foregroundcolor Red
    Write-Host "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine`n" -Foregroundcolor Red
    Write-Host "================================================================`n" -Foregroundcolor Red

    $pwshPath = Get-Command pwsh -ErrorAction SilentlyContinue
    $RunningPowerShell = "PowerShell"
    if ($pwshPath) {
        Write-Host "Running in powershell 7"
        $RunningPowerShell = "pwsh"
    }
    # $PSCommandPath : Contains the full path and filename of the script that's being run
    # Check if Windows Terminal (wt.exe) exists in the environment
    try {
        if (Get-Command "wt" -ErrorAction SilentlyContinue) {
            Write-Host "Running in Windows Terminal"
            Start-Sleep -Seconds 1
            Start-Process "wt" -ArgumentList "$RunningPowerShell -NoExit -Command `"& '$PSCommandPath' -ScriptLocation '$(Get-Location)'`"" -Verb RunAs
        }
        else {
            Write-Host "Windows Terminal (wt.exe) not found in the environment."
            Write-Host "Running with $RunningPowerShell "
            Start-Sleep -Seconds 1
            Start-Process "$RunningPowerShell" -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"Set-Location `"$(Get-Location)`"; & `"$PSCommandPath`";`"" -ErrorAction Stop
        }
    }
    catch {
        Write-Error "Failed to start PowerShell with admin rights. Error: $_"
        pause
        exit 1
    }

    Write-Host "Exiting ..."
    Start-Sleep -Seconds 3
    exit 0
}

#region Run in pwsh
#Write-Host "Checking if pwsh exist"
Start-Sleep -Seconds 1
# If not running with powershell7 and powershell7 is installed
$pwshPath = Get-Command pwsh -ErrorAction SilentlyContinue
$isBuiltInWindowsPowerShell = ($PSVersionTable.PSEdition -eq 'Desktop')
if ($pwshPath -and $isBuiltInWindowsPowerShell) {
    if (Get-Command "wt" -ErrorAction SilentlyContinue) {
        Write-Host "Running in Windows Terminal And Powershell 7"
        Start-Sleep -Seconds 1
        Start-Process "wt" -ArgumentList "pwsh -NoExit -Command `"& '$PSCommandPath' -ScriptLocation '$(Get-Location)'`"" -Verb RunAs
    }
    else {
        Write-Host "Windows Terminal (wt.exe) not found in the environment."
        Write-Host "Running in Powershell 7"
        Start-Sleep -Seconds 1
        Start-Process pwsh -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"Set-Location `"$(Get-Location)`"; & `"$PSCommandPath`";`"" -ErrorAction Stop
    }
    Write-Host "`nExiting ..."
    Start-Sleep -Seconds 3
    exit 0
}
#TODO: If running in buildIn and not wt and wt installed run in wt buildIn







# @{ Message = ""
#         Data = @(
#             @{
#                 Name = ""
#                 Type = ""
#                 Path = ""
#                 Value = ""
#             }
#         )
#     }




# @{ Name         = ""
#     Source      = ""
#     Id          = ""
#     Installer   = "winget"
#     Description = ""
# }
