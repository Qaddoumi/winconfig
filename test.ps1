
# Define the URL for the Security Compliance Toolkit download
$downloadUrl = "https://download.microsoft.com/download/8/5/C/85C25433-A1B0-4FFA-9429-7E023E7DA8D8/LGPO.zip"
$zipPath = "$env:USERPROFILE\Downloads\LGPO.zip"
#$extractPath = "$env:USERPROFILE\Downloads\LGPO"
$extractPath = "$env:SystemDrive\Tools"

# Download the zip file
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

# Extract the contents
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

# Clean up
Remove-Item $zipPath

# Example of adding LGPO.exe to PATH
$lgpoPath = "$env:SystemDrive\Tools\LGPO_30"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$lgpoPath", [System.EnvironmentVariableTarget]::Machine)



$wingetOutput = winget list
# Flag to start collecting lines after finding the headers
$foundHeader = $false

# Use a loop to filter lines until the header is found
$filteredOutput = foreach ($line in $wingetOutput) {
    # Set flag to true after finding the header line
    if ($line -match '^-{3,}') {
        $foundHeader = $true
        continue
    }

    # Skip lines until the header is found
    if ($foundHeader) {
        # Output remaining lines after finding the header
        $line
    }
}

# Display the filtered output
$filteredOutput
$filteredOutput.Count
