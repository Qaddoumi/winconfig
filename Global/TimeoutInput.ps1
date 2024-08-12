function TimeoutInput {
    param(
        [string]$Prompt = "Do you to proceed with the recommended`?``(y/N``)",
        [int]$TimeoutSeconds = 5,
        [string]$DefaultValue = "N"
    )

    $userInput = $DefaultValue
    $OutputFile = "$env:TEMP\userinput.txt"

    # Create a job for the timeout
    $timeoutJob = Start-Job -ScriptBlock {
        param ($timeout, $defaultValue)
        Start-Sleep -Seconds $timeout
        return $defaultValue
    } -ArgumentList $TimeoutSeconds, $DefaultValue

    $command = "Write-Host `"$Prompt `" -NoNewline;`$UserInput = (Read-Host).Trim();if ([string]::IsNullOrWhiteSpace(`$UserInput)) {`$UserInput = `"$DefaultValue`"}`$UserInput = `$UserInput.ToLower();`$UserInput | Out-File -FilePath `"$OutputFile`" -NoNewline"

    # Start the process with the command
    $process = Start-Process pwsh -NoNewWindow -PassThru -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"$command`""

    while ($true) {
        if ($process.HasExited) {
            if (Test-Path $OutputFile) {
                $userInput = Get-Content $OutputFile -Raw
            }
            Write-Host "Choosing : $userInput"
            break
        }
        if (Get-Job -Id $timeoutJob.Id | Where-Object { $_.State -eq 'Completed' }) {
            Stop-Process -Id $process.Id  -PassThru -Force
            $userInput = $DefaultValue
            Write-Host "`nTimed out. Using default value: $userInput"
            break
        }
        Start-Sleep -Milliseconds 100
    }

    Stop-Job -Id $timeoutJob.Id | Out-Null
    Remove-Job -Id $timeoutJob.Id | Out-Null

    # Clean up the temporary file
    if (Test-Path $OutputFile) {
        Remove-Item $OutputFile
    }

    return $userInput
}