function Enable-UltimatePerformance {
    <#
    .SYNOPSIS
        Creates or removes the Ultimate Performance power scheme
    .PARAMETER State
        Indicates whether to enable or disable the Ultimate Performance power scheme
    #>
    $state = "Enable"
    Try {
        # Check if Ultimate Performance plan is installed
        $ultimatePlan = powercfg -list | Select-String -Pattern "Ultimate Performance"
        if ($state -eq "Enable") {
            if ($ultimatePlan) {
                Write-Host "Ultimate Performance plan is already installed." -ForegroundColor Green
            }
            else {
                Write-Host "Installing Ultimate Performance plan..." -ForegroundColor Green
                powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
                Write-Host "> Ultimate Performance plan installed." -ForegroundColor Cyan
            }

            # Set the Ultimate Performance plan as active
            $ultimatePlanGUID = (powercfg -list | Select-String -Pattern "Ultimate Performance").Line.Split()[3]
            powercfg -setactive $ultimatePlanGUID

            Write-Host "Ultimate Performance plan is now active." -ForegroundColor Cyan
        }
        elseif ($state -eq "Disable") {
            if ($ultimatePlan) {
                # Extract the GUID of the Ultimate Performance plan
                $ultimatePlanGUID = $ultimatePlan.Line.Split()[3]

                # Set a different power plan as active before deleting the Ultimate Performance plan
                $balancedPlanGUID = (powercfg -list | Select-String -Pattern "Balanced").Line.Split()[3]
                powercfg -setactive $balancedPlanGUID

                # Delete the Ultimate Performance plan
                powercfg -delete $ultimatePlanGUID

                Write-Host "Ultimate Performance plan has been uninstalled." -ForegroundColor Green
                Write-Host "> Balanced plan is now active." -ForegroundColor Cyan
            }
            else {
                Write-Host "Ultimate Performance plan is not installed." -ForegroundColor Yellow
            }
        }
    }
    Catch {
        Write-Warning $PSItem.Exception.Message
    }
}
Write-Host "Enabling Ultimate Performance"
Enable-UltimatePerformance

Write-Host "`n================================================================"
Write-Host "Set Hibernation as default, and stop sleep mode" -ForegroundColor Green

$HibernationRegistry = @(
    @{
        Name          = "Attributes"
        Type          = "DWord"
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\7bc4a2f9-d8fc-4469-b07b-33eb785aaca0"
        Value         = "2"
        OriginalValue = "1"
    }
    @{
        Name          = "Attributes "
        Type          = "DWord"
        Path          = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab\94ac6d29-73ce-41a6-809f-6363ba21b47e"
        Value         = "2"
        OriginalValue = "0"
    }
    @{
        Name          = "HibernateEnabled"
        Type          = "DWord"
        Path          = "HKLM:\System\CurrentControlSet\Control\Session Manager\Power"
        Value         = "0"
        OriginalValue = "1"
    }
    @{
        Name          = "ShowHibernateOption"
        Type          = "DWord"
        Path          = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings"
        Value         = "0"
        OriginalValue = "1"
    }
)
. "..\Global\Set-Registry.ps1"
foreach ($Entry in $HibernationRegistry) {
    Write-Host "================================================================"
    Set-Registry -Name $Entry.Name -Path $Entry.Path -Type $Entry.Type -Value $Entry.Value
}

Write-Host "`n================================================================"
Write-Host "Turn on Hibernation" -ForegroundColor Green
Start-Process -FilePath powercfg -ArgumentList "/hibernate on" -NoNewWindow -Wait

Write-Host "`n================================================================"
Write-Host "Turn off sleep mode and setting screen off after 20minute ac, 10minute dc(battry)" -ForegroundColor Green
# Set hibernation as the default action
Start-Process -FilePath powercfg -ArgumentList "/change standby-timeout-ac 0" -NoNewWindow -Wait
Start-Process -FilePath powercfg -ArgumentList "/change standby-timeout-dc 0" -NoNewWindow -Wait
Start-Process -FilePath powercfg -ArgumentList "/change monitor-timeout-ac 20" -NoNewWindow -Wait
Start-Process -FilePath powercfg -ArgumentList "/change monitor-timeout-dc 10" -NoNewWindow -Wait

<#
Write-Host "Turn off Hibernation"
Start-Process -FilePath powercfg -ArgumentList "/hibernate off" -NoNewWindow -Wait
#>
