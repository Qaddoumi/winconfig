[CmdletBinding()]
param (
    [string]$ScriptLocation = ""
)
if ($ScriptLocation) {
    Set-Location $ScriptLocation
}

$scripts = @(
    @{ Name = ".\PreRequisite\Install_winget.ps1"; Description = "Install winget"; Parameter = "-Force"; SleepTime = 3; MessageAfter = "You may need to restart if did not work" }
    @{ Name = ".\PreRequisite\install_PS_WT_Git.ps1"; Description = "Install essential programs"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\ProgramsConfigFiles\SetWT&PS&Code_settings.ps1"; Description = "Set essential programs settings"; Parameter = ""; SleepTime = 0; MessageAfter = "Hold ctrl then right click mouse button to refresh shell & Restart Explorer" }
    @{ Name = ".\PreRequisite\SET_EP.ps1"; Description = "Set Execution Policy"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\WindowsTweaks\ApplyTweaks.ps1"; Description = "Apply Windows Tweaks, And remove telemetry"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart for some setting to change`nOr restart explorer" }
    @{ Name = ".\WindowsCleanupMaintenance\RestartExplorer.ps1"; Description = "Restart Explorer"; Parameter = ""; SleepTime = 3; MessageAfter = "" }
    
    @{ Name = ".\Hibernation.ps1"; Description = "Enabling Ultimate Performance, Turn on hibernation and stop sleep mode"; Parameter = ""; SleepTime = 2; MessageAfter = "" }
    @{ Name = ".\LegacyF8BootRecovery.ps1"; Description = "Enables Advanced Boot Options screen that lets you start Windows in advanced troubleshooting modes"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\MSCopilot.ps1"; Description = "Remove MSCopilot,and turn off Recall"; Parameter = ""; SleepTime = 0; MessageAfter = "You may need to restart for some setting to change" }
    @{ Name = ".\RemoveMSStoreApps.ps1"; Description = "Remove Microsoft Store Apps"; Parameter = ""; SleepTime = 0; MessageAfter = "" }
    @{ Name = ".\TimeZoneLanguages.ps1"; Description = "Setting date, date format, timezone and location"; Parameter = ""; SleepTime = 2; MessageAfter = "" }
)

foreach ($script in $scripts) {
    $scriptToRun = $script.Name
    if (-not (Test-Path $scriptToRun)) {
        Write-Warning "Script not found: $scriptToRun"
        continue
    }

    $scriptDirectory = Split-Path -Parent $scriptToRun
    $originalDirectory = Get-Location

    if ($scriptDirectory -ne '') {
        Set-Location $scriptDirectory
    }

    Write-Output "`n================================================================"
    Write-Output "================================================================"

    if ($script.Parameter) {
        $command = "& .\$(Split-Path -Leaf $scriptToRun) $($script.Parameter)"
        Invoke-Expression $command
    } else {
        & .\$(Split-Path -Leaf $scriptToRun)
    }
    if ($script.MessageAfter) {
        Write-Host ""
        Write-Warning $script.MessageAfter
    }
    if ($script.SleepTime) {
        Start-Sleep -Seconds $script.SleepTime
    }

    
    Set-Location $originalDirectory
}

Write-Output "`n================================================================"
Write-Output "================================================================"
Write-Output "`n   === All Scripts Have Been Executed ===`n"