. "..\Global\Set-Registry.ps1"

Write-Host "Disables MS Copilot AI built into Windows since 23H2, and turn off Recall" -ForegroundColor Green
$RegData = @(
#region Disable Copilot
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
#region Disable Windows Recall
    @{
        Name  = "DisableAIDataAnalysis"
        Type  = "DWord"
        Path  = "HKU:\DefaultUser\Software\Policies\Microsoft\Windows\WindowsAI"
        Value = "1"
    }
    @{
        Name  = "DisableAIDataAnalysis"
        Type  = "DWord"
        Path  = "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI"
        Value = "1"
    }
    @{
        Name  = "DisableAIDataAnalysis"
        Type  = "DWord"
        Path  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
        Value = "1"
    }
    @{
        Name  = "TurnOffSavingSnapshots"
        Type  = "DWord"
        Path  = "HKU:\DefaultUser\Software\Policies\Microsoft\Windows\Windows AI"
        Value = "1"
    }
    @{
        Name  = "TurnOffSavingSnapshots"
        Type  = "DWord"
        Path  = "HKCU:\DefaultUser\Software\Policies\Microsoft\Windows\Windows AI"
        Value = "1"
    }
    @{
        Name  = "TurnOffSavingSnapshots"
        Type  = "DWord"
        Path  = "HKLM:\DefaultUser\Software\Policies\Microsoft\Windows\Windows AI"
        Value = "1"
    }
)

foreach($entry in $RegData){
    Set-Registry -Name $entry.Name -Path $entry.Path -Type $entry.Type -Value $entry.Value
}

try{
    Write-Host "`nRemove Copilot Package" -ForegroundColor Cyan
    $Name = "Microsoft.Windows.Ai.Copilot.Provider"
    Get-AppxPackage "*$Name*" -allusers | Remove-AppxPackage -allusers -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$Name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    $Name = "Microsoft.Windows.Copilot"
    Get-AppxPackage "*$Name*" -allusers | Remove-AppxPackage -allusers -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$Name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}
catch{
    Write-Warning "Unable to Remove Copilot due to unhandled exception"
    Write-Warning $PSItem.Exception.StackTrace
}