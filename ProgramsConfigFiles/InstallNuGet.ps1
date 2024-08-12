# Check if the running PowerShell is the built-in Windows PowerShell
$isBuiltInWindowsPowerShell = ($PSVersionTable.PSEdition -eq 'Desktop')

if ($isBuiltInWindowsPowerShell) {
    Write-Output "`nThis is the built-in Windows PowerShell, Installing NuGet provider...."
    
    # Install NuGet provider
    Install-PackageProvider -Name NuGet -Force
    
    # Verify installation
    if (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue) {
        Write-Output "NuGet provider installed successfully."
    } else {
        Write-Output "Failed to install the NuGet provider."
    }
} else {
    Write-Output "`nThis is not the built-in Windows PowerShell"
    Write-Output "No need to install NuGet"
}
