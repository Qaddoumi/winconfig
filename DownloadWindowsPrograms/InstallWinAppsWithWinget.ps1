# Function to install a program using winget
function Install-Program {
    param (
        [string]$program
    )
    Write-Output "Starting installation check for $program..."

    Write-Output "Checking if $program is already installed..."
    $installedPrograms = winget list --id $program | Select-String -Pattern $program
    if ($null -ne $installedPrograms) {
        Write-Output "Output from winget list:`n$($installedPrograms -join '; ')"
        Write-Output "Skipping installation of $program as it is already installed."
    } else {
        Write-Output "$program is not installed."
        Write-Output "Attempting to install $program..."
        try {
            $installArgs = "install --exact --id $program  --source winget --accept-package-agreements --accept-source-agreements"
            $process = Start-Process -FilePath "winget" -ArgumentList $installArgs -NoNewWindow -PassThru -Wait
            # always use -Wait instaed of $process.WaitForExit() because it did not work well in build in powershell
            # Check the exit code of the process
            $exitCode = $process.ExitCode
            if ($exitCode -eq 0) {
                Write-Host "Done Installing (ID): $program Exit code: $($exitCode)"
            } 
            elseif ($exitCode -eq  -1978335189){
                Write-Host "$program No applicable update found"
            }
            else {
                Write-Host "Failed to install $program. Exit code: $($exitCode)"
            }
        } 
        catch {
            Write-Output "An error occurred while attempting to install $program. Error: $_"
        }
    }
}

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1
Write-Output "`n================================================================"

# Main script execution
Write-Output "`n   === Start Installing Programs : ==="

# Source the variable definition script (List of Programs IDs)
. ".\WINGET_Programs.ps1"

# Installing each program
for ($i = 0; $i -lt $WINGET_PROGRAMS_ID.Count; $i++) {
    $program = $WINGET_PROGRAMS_ID[$i]

    # Calculate the percentage complete for Write-Progress
    $percentComplete = ($i / $WINGET_PROGRAMS_ID.Count) * 100

    # Update the progress bar
    Write-Progress -Activity "Installing Programs" -Status "Processing program $($i + 1) of $($WINGET_PROGRAMS_ID.Count)" -PercentComplete $percentComplete

    Write-Output "`n================================================================"
    Write-Output "`n ($($i + 1)/$($WINGET_PROGRAMS_ID.Count)) - Processing program(ID) : $program"

    # Call your custom function to install the program
    Install-Program -program $program
}
# Ensure the progress bar is cleared after the loop
Write-Progress -Activity "Installing Programs" -Completed

Write-Output "`n================================================================"
Write-Output "`nInstalling programs Finished."

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1
