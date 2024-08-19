# To Use "HKU:\" reg path instaed of "Registry::HKU\"
if (!(Test-Path 'HKU:')) {
    Write-Host "Creating HKU: drive..." -ForegroundColor Yellow
    New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
}

function Set-Registry {
    <#
    .EXAMPLE
    Set-Registry -Name "PublishUserActivities" -Path "HKLM:\SOFTWARE\Policies\Microsoft" -Type "DWord" -Value "0"
    #>
    param (
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$Path,

        [ValidateSet("String", "ExpandString", "Binary", "DWord", "QWord", "MultiString")]
        [string]$Type,

        [object]$Value
    )
    If (!(Test-Path $Path)) {
        Write-Warning "$Path was not found, Creating..."
        New-Item -Path $Path -Force -ErrorAction Continue | Out-Null
    }
    Try {
        Write-Host "Setting registry key: $Name at $Path" -ForegroundColor Cyan
        # Set the property, creating it if it doesn''t exist
        New-ItemProperty -Path $Path -Name $Name -PropertyType $Type -Value $Value -Force | Out-Null
    }
    Catch [System.Security.SecurityException] {
        Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
    }
    Catch [System.Management.Automation.ItemNotFoundException] {
        Write-Warning $PSItem.Exception.ErrorRecord
    }
    Catch {
        Write-Warning "Unable to set $Name due to unhandled exception"
        Write-Warning $PSItem.Exception.StackTrace
    }
}