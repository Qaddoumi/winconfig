. "..\Global\Set-Registry.ps1"

# TODO: Implement this
function Disable-Teredo{ # Teredo network tunneling is a ipv6 feature that can cause additional latency
    Write-Host "Disable Teredo (ipv6 feature that can cause additional latency)" -ForegroundColor Green
    $RegData = @{
        Name = "DisabledComponents"
        Type = "DWord"
        Path = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
        Value = "1"
        OriginalValue = "0"
        <#
            0x00: Default value; all IPv6 components are enabled.
            0x01: Disable the creation of IPv6 global unique addresses.
            0x02: Disable the IPv6 tunnel interfaces (6to4, ISATAP, etc.).
            0x10: Disable native IPv6 over the Ethernet interfaces.
            0x20: Prefer IPv4 over IPv6.
            0xFF: Disable all IPv6 components.
            For example, setting the value to 0x20 will prefer IPv4 over IPv6, while 0xFF will disable IPv6 entirely.
        #>
    }
    Set-Registry -Name $RegData.Name -Path $RegData.Path -Type $RegData.Type -Value $RegData.Value
    Try{
        netsh interface teredo set state disabled
        <#
        UndoScript = 
            netsh interface teredo set state default
        #>
    }
    Catch{
        Write-Warning "Unable to disable teredo due to unhandled exception"
        Write-Warning $PSItem.Exception.StackTrace
    }
}