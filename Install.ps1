﻿[CmdletBinding()]
param (
    [string]$ScriptLocation = ""
)
if($ScriptLocation){
    Set-Location $ScriptLocation
}
#region Run As Admin
# Check for admin privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Host "================================================================`n" -Foregroundcolor Red
    Write-Host "Run the script with Admin rights`n" -Foregroundcolor Red
    Write-Host "Change Execution Policy by running : `n" -Foregroundcolor Red
    Write-Host "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine`n" -Foregroundcolor Red
    Write-Host "================================================================`n" -Foregroundcolor Red

    $pwshPath = Get-Command pwsh -ErrorAction SilentlyContinue
    $RunningPowerShell = "PowerShell"
    if($pwshPath){
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
        } else {
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
    Start-Sleep -Seconds 2
    exit 0
}

#region Run in pwsh
#Write-Host "Checking if pwsh exist"
Start-Sleep -Seconds 1
# If not running with powershell7 and powershell7 is installed
$pwshPath = Get-Command pwsh -ErrorAction SilentlyContinue
$isBuiltInWindowsPowerShell = ($PSVersionTable.PSEdition -eq 'Desktop')
if($pwshPath -and $isBuiltInWindowsPowerShell){
    if (Get-Command "wt" -ErrorAction SilentlyContinue) {
        Write-Host "Running in Windows Terminal And Powershell 7"
        Start-Sleep -Seconds 1
        Start-Process "wt" -ArgumentList "pwsh -NoExit -Command `"& '$PSCommandPath' -ScriptLocation '$(Get-Location)'`"" -Verb RunAs
    } else {
        Write-Host "Windows Terminal (wt.exe) not found in the environment."
        Write-Host "Running in Powershell 7"
        Start-Sleep -Seconds 1
        Start-Process pwsh -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"Set-Location `"$(Get-Location)`"; & `"$PSCommandPath`";`"" -ErrorAction Stop
    }
    Write-Host "`nExiting ..."
    Start-Sleep -Seconds 2
    exit 0
}
# TODO:(don't do) If running in buildIn and not wt and wt installed run in wt buildIn
# tried all method for this but nothing works in a situation where if you go to
# start menu and open powershell or pwsh and it openned in windows terminal then
# any method will fail to detect if it running in windows terminal
# Hopfully someone fix this oneday

# Font : Small Keyboard
Write-Host "        ____ ____ ____ ____ ____ ____ ____ _________ ____ ____ "
Write-Host "       ||W |||e |||l |||c |||o |||m |||e |||       |||T |||o ||"
Write-Host "       ||__|||__|||__|||__|||__|||__|||__|||_______|||__|||__||"
Write-Host "       |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|"
# Font : ANSI Shadow
Write-Host "██╗    ██╗██╗███╗   ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ "
Write-Host "██║    ██║██║████╗  ██║██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ "
Write-Host "██║ █╗ ██║██║██╔██╗ ██║██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗"
Write-Host "██║███╗██║██║██║╚██╗██║██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║"
Write-Host "╚███╔███╔╝██║██║ ╚████║╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝"
Write-Host " ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ "
Write-Host "                                                                      "

#region Define the scripts
#  and their descriptions
$scripts = @(
    @{ Name = ".\PreRequisite\Install_winget.ps1"; Description = "Install winget"; Parameter = "-Force"; SleepTime = 3; MessageAfter = "You may need to restart if did not work"}
    @{ Name = ".\PreRequisite\install_PS_WT_Git.ps1"; Description = "Install pwsh,wt,git etc.."; Parameter = ""; SleepTime = 0; MessageAfter = ""}
    @{ Name = ".\PreRequisite\SET_EP.ps1"; Description = "Set Execution Policy"; Parameter = ""; SleepTime = 0; MessageAfter = ""}
    @{ Name = ".\DownloadWindowsPrograms\InstallWinAppsWithWinget.ps1"; Description = "Bulk install windows progarm"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\DownloadWindowsPrograms\UpdatePrograms.ps1"; Description = "Bulk Upgrade windows progarm"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\ProgramsConfigFiles\SetWT&PS&Code_settings.ps1"; Description = "Set WindowsTerminal, PowerShell, Windhawk, Shell & Code Settings"; Parameter = ""; SleepTime = 0; MessageAfter = "Hold ctrl then right click mouse button to refresh shell" }
    @{ Name = ".\WindowsTweaks\ApplyTweaks.ps1"; Description = "Apply Windows Tweaks, And remove telemetry"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart for some setting to change`nOr restart explorer" }
    @{ Name = ".\WindowsTweaksAdvanced\ApplyAdvancedTweaks.ps1"; Description = "Advanced Tweaks Menu"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\WindowsCleanupMaintenance\RestartExplorer.ps1"; Description = "Restart Explorer"; Parameter = ""; SleepTime = 3; MessageAfter = "" }
)

#region Display Menu
# and get user choice
function Show-Menu {
    param (
        [string]$prompt = 'Select a script to run:'
    )

    $host.ui.RawUI.WindowTitle = """Winconfig"""
    # TODO: make a choice to run everythings.
    # 1. Run all scripts
    Write-Host $prompt -ForegroundColor Green
    for ($i = 0; $i -lt $scripts.Count; $i++) {
        Write-Host "$($i + 1). $($scripts[$i].Description)" -ForegroundColor Cyan
    }
    Write-Host "$($scripts.Count + 1). Clear Screen" -ForegroundColor Cyan
    Write-Host "$($scripts.Count + 2). Exit" -ForegroundColor Cyan

    $choice = Read-Host "Enter the number of your choice"
    return [int]$choice
}

# Main logic
#region Excute The Scripts
do {
    $choice = Show-Menu

    if ($choice -gt 0 -and $choice -le $scripts.Count) {
        $scriptToRun = $scripts[$choice - 1].Name
        $scriptParameter = $scripts[$choice - 1].Parameter
        $sleepTime = $scripts[$choice - 1].SleepTime
        $messageAfter = $scripts[$choice - 1].MessageAfter
        $scriptDirectory = Split-Path -Parent $scriptToRun
        $originalDirectory = Get-Location

        if ($scriptDirectory -ne '') {
            #Write-Host "`nChanging directory to $scriptDirectory"
            Set-Location $scriptDirectory
        }

        Write-Output "`n================================================================"
        Write-Output "================================================================"
        # TODO: Add Try Catch

        #Write-Host "`nRunning $scriptToRun...`n"
        #Write-Output "================================================================"
        if ($scriptParameter) {
            $command = "& .\$(Split-Path -Leaf $scriptToRun) $scriptParameter"
            Invoke-Expression $command
        } else {
            & .\$(Split-Path -Leaf $scriptToRun)
        }
        if($messageAfter){
            Write-Host ""
            Write-Warning $messageAfter
        }
        if($sleepTime){
            Start-Sleep -Seconds $sleepTime
        }

        Write-Output "`n================================================================"
        Write-Output "================================================================"

        if ($scriptDirectory -ne '') {
            #Write-Host "`nReturning to original directory $originalDirectory`n"
            Set-Location $originalDirectory
            #Write-Output "================================================================`n"
        }
    } elseif ($choice -eq $scripts.Count + 1) {
        Clear-Host
    } elseif ($choice -eq $scripts.Count + 2) {
        Write-Host "`nExiting..."
        break
    } else {
        Write-Host "Invalid choice. Please try again." -ForegroundColor Red
        Write-Output "================================================================"
    }
} while ($true)
#region Exit
Write-Host " _____                       "
Write-Host "(____ \                      "
Write-Host " _   \ \ ___  ____   ____    "
Write-Host "| |   | / _ \|  _ \ / _  )   "
Write-Host "| |__/ / |_| | | | ( (/ /    "
Write-Host "|_____/ \___/|_| |_|\____)   "
Write-Host ""

Write-Host "   ____   __   __U _____ u "
Write-Host "U | __`")u \ \ / /\| ___`"|/ "
Write-Host " \|  _ \/  \ V /  |  _|`"   "
Write-Host "  | |_) | U_|`"|_u | |___   "
Write-Host "  |____/    |_|   |_____|  "
Write-Host " _|| \\_.-,//|(_  <<   >>  "
Write-Host "(__) (__)\_) (__)(__) (__) "
exit 0