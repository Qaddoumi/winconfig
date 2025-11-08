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

foreach ($Entry in $ScheduledTaskSettings) {
    Set-ScheduledTask -Name $Entry.Name -State $Entry.State
}