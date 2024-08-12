function Update-PathEnvironmentVariable {
    <#
        .SYNOPSIS
        Updates the PATH environment variable with a new path for both the User and Machine levels.

        .DESCRIPTION
        The function will add a new path to the PATH environment variable, making sure it is not a duplicate.
        If the new path is already in the PATH variable, the function will skip adding it.
        This function operates at both User and Machine levels.

        .PARAMETER NewPath
        The new directory path to be added to the PATH environment variable.

        .EXAMPLE
        Update-PathEnvironmentVariable -NewPath "C:\NewDirectory"
        This command will add the directory "C:\NewDirectory" to the PATH variable at both the User and Machine levels.
    #>
    param(
        [string]$NewPath
    )

    foreach ($Level in "Machine", "User") {
        # Get the current PATH variable
        $path = [Environment]::GetEnvironmentVariable("PATH", $Level)

        # Check if the new path is already in the PATH variable
        if (!$path.Contains($NewPath)) {
            Write-Output "Adding $NewPath to PATH variable for $Level..."

            # Add the new path to the PATH variable
            $path = ($path + ";" + $NewPath).Split(';') | Select-Object -Unique
            $path = $path -join ';'

            # Set the new PATH variable
            [Environment]::SetEnvironmentVariable("PATH", $path, $Level)
        } else {
            Write-Output "$NewPath already present in PATH variable for $Level, skipping."
        }
    }
}

# Add the WindowsApps directory to the PATH variable
Write-Output "Checking and adding WindowsApps directory to PATH variable for current user if not present..."
$WindowsAppsPath = [IO.Path]::Combine([Environment]::GetEnvironmentVariable("LOCALAPPDATA"), "Microsoft", "WindowsApps")
Update-PathEnvironmentVariable -NewPath $WindowsAppsPath

$ENV:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Display refreshed environment variables
Write-Output "`nRefreshed environment variables:`n"
Get-ChildItem Env:
Write-Output "`nDone Refreshing ENV"
