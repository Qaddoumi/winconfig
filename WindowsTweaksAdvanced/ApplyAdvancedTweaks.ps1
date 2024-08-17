#TODO: Not finished

#region Define the scripts
#  and their descriptions
$scripts = @(
    @{ Name = ".\TimeZoneLanguages.ps1"; Description = "Setting date, date format, timezone and location"; Parameter = ""; SleepTime = 2; MessageAfter = "" }
    @{ Name = ".\Hibernation.ps1"; Description = "Enabling Ultimate Performance, Turn on hibernation and stop sleep mode"; Parameter = ""; SleepTime = 2; MessageAfter = "" }
    @{ Name = ".\SET_DNS.ps1"; Description = "Choose DNS to set to DHCP or Google or AdGuard_Ads_Trackers or etc..."; Parameter = ""; SleepTime = 2; MessageAfter = "" }
    @{ Name = ".\RemoveEdge.ps1"; Description = "Remove Microsoft Edge Browser"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart for some setting to change" }
    @{ Name = ".\RemoveTeams.ps1"; Description = "Remove Microsoft Teams"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart if some setting did not change" }
    @{ Name = "..\WindowsCleanupMaintenance\Maintenance.ps1"; Description = "Daily Registry Backup AND Create Restore Point"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = "..\WindowsCleanupMaintenance\DeleteTempFiles.ps1"; Description = "Delete Temp files and disk cleanup"; Parameter = ""; SleepTime = 0; MessageAfter = "" }

    # @{ Name = ".\Install_winget.ps1"; Description = ""; Parameter = ""; SleepTime = 0; MessageAfter = "" }
)

#region Display Menu
# and get user choice
function Show-Menu {
    param (
        [string]$prompt = "`nSelect a script to run:"
    )

    # TODO: make a choice to run everythings.
    # 1. Run all scripts
    Write-Host $prompt -ForegroundColor Green
    for ($i = 0; $i -lt $scripts.Count; $i++) {
        Write-Host "$($i + 1). $($scripts[$i].Description)" -ForegroundColor Cyan
    }
    Write-Host "$($scripts.Count + 1). Return to main menu" -ForegroundColor Cyan

    $choice = Read-Host "Enter the number of your choice"
    return [int]$choice
}

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
        }
        else {
            & .\$(Split-Path -Leaf $scriptToRun)
        }
        if ($messageAfter) {
            Write-Host ""
            Write-Warning $messageAfter
        }
        if ($sleepTime) {
            Start-Sleep -Seconds $sleepTime
        }

        Write-Output "`n================================================================"
        Write-Output "================================================================"

        if ($scriptDirectory -ne '') {
            #Write-Host "`nReturning to original directory $originalDirectory`n"
            Set-Location $originalDirectory
            #Write-Output "================================================================`n"
        }
    }
    elseif ($choice -eq $scripts.Count + 1) {
        Write-Host "Returning to main menu" -ForegroundColor Green
        exit
    }
    else {
        Write-Host "Invalid choice. Please try again."
    }
} while ($true)
