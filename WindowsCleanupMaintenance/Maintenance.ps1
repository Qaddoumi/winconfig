# TODO: fix this
Write-Host "Enable Daily Registry Backup Task 12.30am" -ForegroundColor Green
Write-Host "Enables daily registry backup, previously disabled by Microsoft in Windows 10 1803" -ForegroundColor Cyan
[scriptblock]$InvokeScript = {
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager" -Name "EnablePeriodicBackup" -Type DWord -Value 1 -Force
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager" -Name "BackupCount" -Type DWord -Value 2 -Force
    $action = New-ScheduledTaskAction -Execute "schtasks" -Argument "/run /i /tn `"Microsoft\Windows\Registry\RegIdleBackup`""
    $trigger = New-ScheduledTaskTrigger -Daily -At 00:30
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "AutoRegBackup" -Description "Create System Registry Backups" -User "System"
}


Write-Host "Create Restore Point" -ForegroundColor Green
Write-Host "Creates a restore point at runtime in case a revert is needed from WinUtil modifications" -ForegroundColor Cyan
[scriptblock]$InvokeScript = {
    # Check if the user has administrative privileges
    if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "Please run this script as an administrator."
        return
    }

    # Check if System Restore is enabled for the main drive
    try {
        # Try getting restore points to check if System Restore is enabled
        Enable-ComputerRestore -Drive "$env:SystemDrive"
    } catch {
        Write-Host "An error occurred while enabling System Restore: $_"
    }

    # Check if the SystemRestorePointCreationFrequency value exists
    $exists = Get-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -ErrorAction SilentlyContinue
    if($null -eq $exists){
        write-host "Changing system to allow multiple restore points per day"
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value "0" -Type DWord -Force -ErrorAction Stop | Out-Null
    }

    # Attempt to load the required module for Get-ComputerRestorePoint
    try {
        Import-Module Microsoft.PowerShell.Management -ErrorAction Stop
    } catch {
        Write-Host "Failed to load the Microsoft.PowerShell.Management module: $_"
        return
    }

    # Get all the restore points for the current day
    try {
        $existingRestorePoints = Get-ComputerRestorePoint | Where-Object { $_.CreationTime.Date -eq (Get-Date).Date }
    } catch {
        Write-Host "Failed to retrieve restore points: $_"
        return
    }

    # Check if there is already a restore point created today
    if ($existingRestorePoints.Count -eq 0) {
        $description = "System Restore Point created by WinUtil"

        Checkpoint-Computer -Description $description -RestorePointType "MODIFY_SETTINGS"
        Write-Host -ForegroundColor Green "System Restore Point Created Successfully"
    }
}

