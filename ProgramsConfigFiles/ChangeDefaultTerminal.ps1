# Get the current user SID
$currentUserSID = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).User

# Define the base registry path using the current user SID
$baseRegPath = "HKU\$currentUserSID\Console\%%Startup"
$delegationConsoleValue = "{2EACA947-7F5F-4CFA-BA87-8F7FBEEFBE69}"
$delegationTerminalValue = "{E12CFF52-A866-4C77-9A90-F570A7AA2C6B}"

# Ensure the path exists by attempting to get a property
if (-not (Test-Path "Registry::$baseRegPath")) {
    Write-Output "The registry path does not exist, can't set default terminal"
    exit
    #TODO: Create the registry path if it doesn't exist
    # New-Item -Path "Registry::HKU\$currentUserSID\Console" -Name "%%Startup" -Force | Out-Null
}

# Set the DelegationConsole value
New-ItemProperty -Path "Registry::$baseRegPath" -Name "DelegationConsole" -Value $delegationConsoleValue -PropertyType String -Force

# Set the DelegationTerminal value
New-ItemProperty -Path "Registry::$baseRegPath" -Name "DelegationTerminal" -Value $delegationTerminalValue -PropertyType String -Force

Write-Host "Registry values updated successfully."
