# TODO: Implement this
$RegistrySettingsTele = @(
    @{
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
        Type          = "DWord"
        Value         = "0"
        Name          = "AllowTelemetry"
        OriginalValue = "1"
    }
    @{
        Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        OriginalValue = "1"
        Name          = "AllowTelemetry"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "ContentDeliveryAllowed"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "OemPreInstalledAppsEnabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "PreInstalledAppsEnabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "PreInstalledAppsEverEnabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "SilentInstalledAppsEnabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "SubscribedContent-338387Enabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "SubscribedContent-338388Enabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "SubscribedContent-338389Enabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "SubscribedContent-353698Enabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        OriginalValue = "1"
        Name          = "SystemPaneSuggestionsEnabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Siuf\Rules"
        OriginalValue = "0"
        Name          = "NumberOfSIUFInPeriod"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        OriginalValue = "0"
        Name          = "DoNotShowFeedbackNotifications"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        OriginalValue = "0"
        Name          = "DisableTailoredExperiencesWithDiagnosticData"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
        OriginalValue = "0"
        Name          = "DisabledByGroupPolicy"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting"
        OriginalValue = "0"
        Name          = "Disabled"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance"
        OriginalValue = "1"
        Name          = "fAllowToGetHelp"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager"
        OriginalValue = "0"
        Name          = "EnthusiastMode"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"
        OriginalValue = "1"
        Name          = "PeopleBand"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem"
        OriginalValue = "0"
        Name          = "LongPathsEnabled"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        _Comment      = "Driver searching is a function that should be left in"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"
        OriginalValue = "1"
        Name          = "SearchOrderConfig"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        OriginalValue = "1"
        Name          = "SystemResponsiveness"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        OriginalValue = "1"
        Name          = "NetworkThrottlingIndex"
        Value         = "4294967295"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Control Panel\Desktop"
        OriginalValue = "1"
        Name          = "MenuShowDelay"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Control Panel\Desktop"
        OriginalValue = "1"
        Name          = "AutoEndTasks"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
        OriginalValue = "0"
        Name          = "ClearPageFileAtShutdown"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKLM:\SYSTEM\ControlSet001\Services\Ndu"
        OriginalValue = "1"
        Name          = "Start"
        Value         = "2"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Control Panel\Mouse"
        OriginalValue = "400"
        Name          = "MouseHoverTime"
        Value         = "400"
        Type          = "String"
    }
    @{
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
        OriginalValue = "20"
        Name          = "IRPStackSize"
        Value         = "30"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
        OriginalValue = "1"
        Name          = "EnableFeeds"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"
        OriginalValue = "1"
        Name          = "ShellFeedsTaskbarViewMode"
        Value         = "2"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        OriginalValue = "1"
        Name          = "HideSCAMeetNow"
        Value         = "1"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement"
        OriginalValue = "1"
        Name          = "ScoobeSystemSettingEnabled"
        Value         = "0"
        Type          = "DWord"
    }
    @{
        Path          = "HKCU:\Environment"
        OriginalValue = "true"
        Name          = "DOTNET_CLI_TELEMETRY_OPTOUT"
        Value         = "false"
        Type          = "String"
    }
)

$ScheduledTaskSettings = @(
    @{ 
        Name          = "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Application Experience\ProgramDataUpdater"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Autochk\Proxy"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Feedback\Siuf\DmClient"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Windows Error Reporting\QueueReporting"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Application Experience\MareBackup"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Application Experience\StartupAppTask"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Application Experience\PcaPatchDbTask"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
    @{
        Name          = "Microsoft\Windows\Maps\MapsUpdateTask"
        State         = "Disabled"
        OriginalState = "Enabled"
    }
)

function Set-ScheduledTask {
    <#
    .EXAMPLE
    Set-ScheduledTask -Name "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" -State "Disabled"
    #>
    param (
        $Name,
        $State
    )

    Try {
        if ($State -eq "Disabled") {
            Write-Host "Disabling Scheduled Task $Name"
            Disable-ScheduledTask -TaskName $Name -ErrorAction Stop
        }
        elseif ($State -eq "Enabled") {
            Write-Host "Enabling Scheduled Task $Name"
            Enable-ScheduledTask -TaskName $Name -ErrorAction Stop
        }
    }
    Catch [System.Exception] {
        if ($PSItem.Exception.Message -like "*The system cannot find the file specified*") {
            Write-Warning "Scheduled Task $Name was not Found"
        }
        Else {
            Write-Warning "Unable to set $Name due to unhandled exception"
            Write-Warning $PSItem.Exception.Message
        }
    }
    Catch {
        Write-Warning "Unable to run script for $Name due to unhandled exception"
        Write-Warning $PSItem.Exception.StackTrace
    }
}

function Disable-Telemetry {
    <#
        This is happen in Enable-LegacyF8BootRecovery function
        bcdedit /set {current} bootmenupolicy Legacy | Out-Null
    #>

    Write-Host "Adjusting Task Manager Preferences" -ForegroundColor Green
    Try {
        If ((Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name CurrentBuild).CurrentBuild -lt 22557) {
            $taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru
            Do {
                Start-Sleep -Milliseconds 100
                $preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
            } Until ($preferences)
            Stop-Process $taskmgr
            $preferences.Preferences[28] = 0
            Set-Registry -Name "Preferences" -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Type "Binary" -Value $preferences.Preferences
        }
    }
    Catch {
        Write-Warning "Failed to adjust Task Manager preferences"
        Write-Warning $PSItem.Exception.Message
    }

    Write-Host "Removing {0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -ForegroundColor Green
    Try {
        Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue
    }
    Catch {
        Write-Warning "Failed to remove the specified registry key"
        Write-Warning $PSItem.Exception.Message
    }

    # Fix Managed by your organization in Edge if registry path exists then remove it
    Write-Host "Fix Managed by your organization in Edge" -ForegroundColor Green
    Try {
        If (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge") {
            Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Recurse -ErrorAction SilentlyContinue
        }
    }
    Catch {
        Write-Warning "Failed to remove Edge policies registry path"
        Write-Warning $PSItem.Exception.Message
    }

    Write-Host "Group svchost.exe processes" -ForegroundColor Green
    Try {
        $ram = (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1kb
        Set-Registry -Name "SvcHostSplitThresholdInKB" -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Type "DWord" -Value $ram
    }
    Catch {
        Write-Warning "Failed to group svchost.exe processes"
        Write-Warning $PSItem.Exception.Message
    }

    # removes a specific diagnostic log file if it exists 
    # and denies SYSTEM access to the AutoLogger directory
    Write-Host "removes diagnostic log file and denies SYSTEM access to the AutoLogger directory" -ForegroundColor Green
    Try {
        $autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
        If (Test-Path "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl") {
            Remove-Item "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl"
        }
        icacls $autoLoggerDir /deny "SYSTEM:(OI)(CI)F" | Out-Null
    }
    Catch {
        Write-Warning "Failed to adjust access permissions on diagnostic logs"
        Write-Warning $PSItem.Exception.Message
    }

    Write-Host "Disable Defender Auto Sample Submission" -ForegroundColor Green
    Try {
        Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction SilentlyContinue | Out-Null
    }
    Catch {
        Write-Warning "Failed to disable Defender auto sample submission"
        Write-Warning $PSItem.Exception.Message
    }
}

#region Start
Write-Host "`nDisable Telemetry" -ForegroundColor Green
Write-Host "Disables Microsoft Telemetry. Note: This will lock many Edge Browser settings. Microsoft spies heavily on you when using the Edge browser.`n" -ForegroundColor Cyan
foreach ($Entry in $RegistrySettingsTele) {
    Set-Registry -Name $Entry.Name -Path $Entry.Path -Type $Entry.Type -Value $Entry.Value
}
foreach ($Entry in $ScheduledTaskSettings) {
    Set-ScheduledTask -Name $Entry.Name -State $Entry.State
}
Disable-Telemetry