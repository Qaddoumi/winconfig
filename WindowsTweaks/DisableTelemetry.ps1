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

Write-Host "`nDisable Telemetry(Part 2)" -ForegroundColor Green
Disable-Telemetry