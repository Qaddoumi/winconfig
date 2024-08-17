. "..\Global\Set-Registry.ps1"

# TODO: Implement this
Write-Host "Disables MS Copilot AI built into Windows since 23H2" -ForegroundColor Green
$RegData = @(
    @{
        Name = "TurnOffWindowsCopilot"
        Type = "DWord"
        Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
        Value = "1"
        OriginalValue = "0"
    }
    @{
        Name = "TurnOffWindowsCopilot"
        Type = "DWord"
        Path = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"
        Value = "1"
        OriginalValue = "0"
    }
    @{
        Name = "ShowCopilotButton"
        Type = "DWord"
        Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Value = "0"
        OriginalValue = "1"
    }
)
foreach($entry in $RegData){
    Set-Registry -Name $entry.Name -Path $entry.Path -Type $entry.Type -Value $entry.Value
}
Try{
    Write-Host "Remove Copilot" -ForegroundColor Gray
    dism /online /remove-package /package-name:Microsoft.Windows.Copilot
    <#
    UndoScript =
        Write-Host "Install Copilot"
        dism /online /add-package /package-name:Microsoft.Windows.Copilot
    #>
}
Catch{
    Write-Warning "Unable to Remove Copilot due to unhandled exception"
    Write-Warning $PSItem.Exception.StackTrace
}

:: Disables Windows Recall on Copilot+ PC - Credit Britec09
reg.exe add "HKU\DefaultUser\Software\Policies\Microsoft\Windows\WindowsAI" /f
reg.exe add "HKU\DefaultUser\Software\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f
reg.exe add "HKU\DefaultUser\Software\Policies\Microsoft\Windows\Windows AI" /v "TurnOffSavingSnapshots" /t REG_DWORD /d 1 /f

:: Disables Windows Recall on Copilot+ PC - Credit Britec09
reg.exe add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\WindowsAI" /f
reg.exe add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Windows AI" /v "TurnOffSavingSnapshots" /t REG_DWORD /d 1 /f
