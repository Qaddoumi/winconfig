[CmdletBinding()]
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
    Start-Sleep -Seconds 3
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
    Start-Sleep -Seconds 3
    exit 0
}
#TODO: If running in buildIn and not wt and wt installed run in wt buildIn

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
    @{ Name = ".\PreRequisite\install_PS_WT_Git.ps1"; Description = "Install powershell 7, windows terminal, AND git"; Parameter = ""; SleepTime = 0; MessageAfter = ""}
    @{ Name = ".\PreRequisite\SET_EP.ps1"; Description = "Set Execution Policy"; Parameter = ""; SleepTime = 0; MessageAfter = ""}
    @{ Name = ".\DownloadWindowsPrograms\InstallWinAppsWithWinget.ps1"; Description = "Bulk install windows progarm"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\DownloadWindowsPrograms\UpdatePrograms.ps1"; Description = "Bulk Upgrade windows progarm"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\ProgramsConfigFiles\SetWT&PS&Code_settings.ps1"; Description = "Set WindowsTerminal, PowerShell, Shell & Code Settings"; Parameter = ""; SleepTime = 0; MessageAfter = "Hold ctrl then click right moush button to refresh shell" }
    @{ Name = ".\WindowsTweaks\ApplyTweaks.ps1"; Description = "Apply Windows Tweaks"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart for some setting to change`nOr restart explorer" }
    @{ Name = ".\WindowsTweaks\RemoveEdge.ps1"; Description = "Remove Microsoft Edge Browser"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart for some setting to change" }
    @{ Name = ".\WindowsTweaks\RemoveTeams.ps1"; Description = "Remove Microsoft Teams"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart if some setting did not change" }
    @{ Name = ".\WindowsCleanupMaintenance\DeleteTempFiles.ps1"; Description = "Delete Temp files and disk cleanup"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\WindowsCleanupMaintenance\Maintenance.ps1"; Description = "Daily Registry Backup AND Create Restore Point"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\WindowsCleanupMaintenance\RestartExplorer.ps1"; Description = "Restart Explorer"; Parameter = ""; SleepTime = 3; MessageAfter = "" }
    # @{ Name = "Script5.ps1"; Description = "Description of Script 5" },
    # @{ Name = "Script6.ps1"; Description = "Description of Script 6" }
)

#region Display Menu
# and get user choice
function Show-Menu {
    param (
        [string]$prompt = 'Select a script to run:'
    )

    # TODO: make a choice to run everythings.
    # 1. Run all scripts
    Write-Host $prompt
    for ($i = 0; $i -lt $scripts.Count; $i++) {
        Write-Host "$($i + 1). $($scripts[$i].Description)"
    }
    Write-Host "$($scripts.Count + 1). Clear Screen"
    Write-Host "$($scripts.Count + 2). Exit"

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
        # TODO: $host.ui.RawUI.WindowTitle = """Winget Install"""
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
        Write-Host "Invalid choice. Please try again."
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