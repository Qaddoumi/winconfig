. "..\Global\Set-Registry.ps1"

# Get the current user SID
$currentUserSID = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).User

$RegData = @(
    @{
        Name  = "DelegationConsole"
        Type  = "String"
        Path  = "HKU:\$currentUserSID\Console\%%Startup"
        Value = "{2EACA947-7F5F-4CFA-BA87-8F7FBEEFBE69}"
    }
    @{
        Name  = "DelegationTerminal"
        Type  = "String"
        Path  = "HKU:\$currentUserSID\Console\%%Startup"
        Value = "{E12CFF52-A866-4C77-9A90-F570A7AA2C6B}"
    }
)
foreach ($entry in $RegData) {
    Set-Registry -Name $entry.Name -Path $entry.Path -Type $entry.Type -Value $entry.Value
}