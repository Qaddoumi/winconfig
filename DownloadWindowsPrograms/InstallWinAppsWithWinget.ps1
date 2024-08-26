function Install-ProgramWithWinget {
    param (
        [Hashtable]$program
    )
    Write-Output "Starting installation check for $($program.Name)..."

    Write-Output "Checking if $($program.Name) is already installed..."
    $isInstalled = $false
    $installedPrograms = (winget list --id $program.Id --exact | ? { $_.Contains($program.Id) })
    if(-not $installedPrograms){
        $Name = "*$($program.Name.Replace(" ","*").Replace(".","*").Replace("+","\+"))*"
        $installedPrograms = (winget list | ? { $_ -like "$Name" })
    }
    if($installedPrograms){
        Write-Output "Output from winget list:`n$($installedPrograms -join '`n')"
        Write-Output "Skipping installation of $($program.Name) as it is already installed."
        $isInstalled = $true
    }
    if ((-not $isInstalled) -and ($program.IsPortable)) {
        if (Test-Path "$($program.Location)\*") {
            Write-Host "Skipping installation of $($program.Name) as it is installed in $($program.Location)."
            $isInstalled = $true
        }
    }

    if (-not $isInstalled){
        Write-Output "$($program.Name) is not installed."
        Write-Output "Attempting to install $($program.Name)..."
        try {
            $locationOption = if ($($program.Location)) { "--location `"$($program.Location)`"" } else { "" }
            $installArgs = "install --exact --id $($program.Id) --source $($program.Source) --accept-package-agreements --accept-source-agreements $locationOption"
            $process = Start-Process -FilePath "winget" -ArgumentList $installArgs -NoNewWindow -PassThru -Wait
            # always use -Wait instaed of $process.WaitForExit() because it did not work well in build in powershell
            $exitCode = $process.ExitCode
            if ($exitCode -eq 0) {
                Write-Host "Done Installing (ID): $($program.Id) Exit code: $exitCode"
            }
            elseif ($exitCode -eq -1978335189){
                Write-Host "$($program.Id) No applicable update found"
            }
            else {
                Write-Host "Failed to install $($program.Id). Exit code: $exitCode"
            }
        }
        catch {
            Write-Output "An error occurred while attempting to install $($program.Id). Error: $PSItem"
        }
    }
}

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1
Write-Output "`n================================================================"

Write-Output "`n   === Start Installing Programs : ==="

# Source the variable definition script (List of Programs IDs)
. ".\WINGET_Programs.ps1"

for ($i = 0; $i -lt $PROGRAMS_COLLECTION.Count; $i++) {
    $program = $PROGRAMS_COLLECTION[$i]

    $percentComplete = ($i + 1) / $PROGRAMS_COLLECTION.Count * 100

    Write-Progress -Activity "Installing Programs" -Status "Processing program $($i + 1) of $($PROGRAMS_COLLECTION.Count)" -PercentComplete $percentComplete -CurrentOperation "($($i + 1)/$($PROGRAMS_COLLECTION.Count))"

    Write-Output "`n================================================================"
    Write-Output "`n ($($i + 1)/$($PROGRAMS_COLLECTION.Count)) - Processing program : $($program.Name)"
    if ($($program.Description)){
        Write-Output "Description/Message : $($program.Description)"
    }
    Write-Output "Id : $($program.Id)"
    Write-Output "Source : $($program.Source)"
    Write-Output "Installer : $($program.Installer)"
    Install-ProgramWithWinget -program $program
}
# Ensure the progress bar is cleared after the loop
Write-Progress -Activity "Installing Programs" -Completed

Write-Output "`n================================================================"
Write-Output "`nInstalling programs Finished."

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1
