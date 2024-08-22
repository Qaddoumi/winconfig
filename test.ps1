
# Define the URL for the Security Compliance Toolkit download
$downloadUrl = "https://download.microsoft.com/download/8/5/C/85C25433-A1B0-4FFA-9429-7E023E7DA8D8/LGPO.zip"
$zipPath = "$env:USERPROFILE\Downloads\LGPO.zip"
#$extractPath = "$env:USERPROFILE\Downloads\LGPO"
$extractPath = "$env:SystemDrive\Tools"


# Download the zip file
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

# Extract the contents
Expand-Archive -Path $zipPath -DestinationPath $extractPath

# Clean up
Remove-Item $zipPath

# Example of adding LGPO.exe to PATH
$lgpoPath = "$env:SystemDrive\Tools\LGPO_30"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$lgpoPath", [System.EnvironmentVariableTarget]::Machine)
