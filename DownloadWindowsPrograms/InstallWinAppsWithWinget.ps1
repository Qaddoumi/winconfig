function Install-ProgramWithWinget {
    param (
        [Hashtable]$program
    )
    Write-Output "Starting installation check for $($program.Name)..."

    Write-Output "Checking if $($program.Name) is already installed..."
    $installedPrograms = winget list --id $program.Id | Select-String -Pattern $program.Id
    if ($null -ne $installedPrograms) {
        Write-Output "Output from winget list:`n$($installedPrograms -join '; ')"
        Write-Output "Skipping installation of $($program.Name) as it is already installed."
    } else {
        Write-Output "$($program.Name) is not installed."
        Write-Output "Attempting to install $($program.Name)..."
        try {
            $installArgs = "install --exact --id $($program.Id) --source $($program.Source) --accept-package-agreements --accept-source-agreements --scope Machine"
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
    Write-Output "Descreption(or Message) : $($program.Description)"
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
