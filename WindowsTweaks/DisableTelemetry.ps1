# TODO: Implement this
$RegistrySettingsTele = @(
    @{
        Name          = "AllowTelemetry"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "AllowTelemetry"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "ContentDeliveryAllowed"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "OemPreInstalledAppsEnabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "PreInstalledAppsEnabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "PreInstalledAppsEverEnabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "SilentInstalledAppsEnabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "SubscribedContent-338387Enabled"
        Type          = "DWord"
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "SubscribedContent-338388Enabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "SubscribedContent-338389Enabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "SubscribedContent-353698Enabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "SystemPaneSuggestionsEnabled"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "NumberOfSIUFInPeriod"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Siuf\Rules"
        Value         = "0"
        OriginalValue = "0"
    }
    @{
        Name          = "DoNotShowFeedbackNotifications"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        Value         = "1"
        OriginalValue = "0"
    }
    @{
        Name          = "DisableTailoredExperiencesWithDiagnosticData"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        Value         = "1"
        OriginalValue = "0"
    }
    @{
        Name          = "DisabledByGroupPolicy"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
        Value         = "1"
        OriginalValue = "0"
    }
    @{
        Name          = "Disabled"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting"
        Value         = "1"
        OriginalValue = "0"
    }
    @{
        Name          = "fAllowToGetHelp"
        Type          = "DWord"
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "EnthusiastMode"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager"
        Value         = "1"
        OriginalValue = "0"
    }
    @{
        Name          = "PeopleBand"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "LongPathsEnabled"
        Type          = "DWord"
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem"
        Value         = "1"
        OriginalValue = "0"
    }
    @{
        _Comment      = "Driver searching is a function that should be left in"
        Name          = "SearchOrderConfig"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"
        Value         = "1"
        OriginalValue = "1"
    }
    @{
        Name          = "SystemResponsiveness"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "NetworkThrottlingIndex"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Value         = "4294967295"
        OriginalValue = "1"
    }
    @{
        Name          = "IRPStackSize"
        Type          = "DWord"
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
        Value         = "30"
        OriginalValue = "20"
    }
    @{
        Name          = "EnableFeeds"
        Type          = "DWord"
        Path          = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "ShellFeedsTaskbarViewMode"
        Type          = "DWord"
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"
        Value         = "2"
        OriginalValue = "1"
    }
    @{
        Name          = "HideSCAMeetNow"
        Type          = "DWord"
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        Value         = "1"
        OriginalValue = "1"
    }
    @{
        Name          = "ScoobeSystemSettingEnabled"
        Type          = "DWord"
        Path          = "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "DOTNET_CLI_TELEMETRY_OPTOUT"
        Type          = "String"
        Path          = "HKCU:\Environment"
        Value         = "false"
        OriginalValue = "true"
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