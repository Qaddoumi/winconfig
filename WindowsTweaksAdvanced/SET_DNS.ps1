$DNS = @(
    @{ Name = "DHCP" }
    @{ Name = "Google"
        Primary =  "8.8.8.8"
        Secondary =  "8.8.4.4"
        Primary6 =  "2001:4860:4860::8888"
        Secondary6 =  "2001:4860:4860::8844"
    }
    @{ Name = "Cloudflare"
        Primary =  "1.1.1.1"
        Secondary =  "1.0.0.1"
        Primary6 =  "2606:4700:4700::1111"
        Secondary6 =  "2606:4700:4700::1001"
    }
    @{ Name = "Cloudflare_Malware"
        Primary =  "1.1.1.2"
        Secondary =  "1.0.0.2"
        Primary6 =  "2606:4700:4700::1112"
        Secondary6 =  "2606:4700:4700::1002"
    }
    @{ Name = "Cloudflare_Malware_Adult"
        Primary =  "1.1.1.3"
        Secondary =  "1.0.0.3"
        Primary6 =  "2606:4700:4700::1113"
        Secondary6 =  "2606:4700:4700::1003"
    }
    @{ Name = "Open_DNS"
        Primary =  "208.67.222.222"
        Secondary =  "208.67.220.220"
        Primary6 =  "2620:119:35::35"
        Secondary6 =  "2620:119:53::53"
    }
    @{ Name = "Quad9"
        Primary =  "9.9.9.9"
        Secondary =  "149.112.112.112"
        Primary6 =  "2620:fe::fe"
        Secondary6 =  "2620:fe::9"
    }
    @{ Name = "AdGuard_Ads_Trackers"
        Primary =  "94.140.14.14"
        Secondary =  "94.140.15.15"
        Primary6 =  "2a10:50c0::ad1:ff"
        Secondary6 =  "2a10:50c0::ad2:ff"
    }
    @{ Name = "AdGuard_Ads_Trackers_Malware_Adult"
        Primary =  "94.140.14.15"
        Secondary =  "94.140.15.16"
        Primary6 =  "2a10:50c0::bad1:ff"
        Secondary6 =  "2a10:50c0::bad2:ff"
    }
)

function Show-Menu {
    param (
        [string]$prompt = "`nChoose from these DNS Providers"
    )

    Write-Host $prompt -ForegroundColor Green
    for ($i = 0; $i -lt $DNS.Count; $i++) {
        Write-Host "[$($i + 1)] - $($DNS[$i].Name)" -ForegroundColor Cyan
    }
    Write-Host "$($DNS.Count + 1). Return to main menu" -ForegroundColor Cyan

    $choice = Read-Host "Enter the number of your choice "
    return [int]$choice
}

function Set-DNS {
    <#

    .SYNOPSIS
        Sets the DNS of all interfaces that are in the "Up" state. It will lookup the values from the DNS.Json file

    .PARAMETER DNSProvider
        The DNS provider to set the DNS server to

    .EXAMPLE
        for Google
        Set-DNS -DNSProvider 1

    #>
    param($DNSProvider = "Default")
    if($DNSProvider -eq "Default"){return}
    try{
        $Adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
        Write-Host "Ensuring DNS is set to $($DNS[$DNSProvider].Name) on the following interfaces"
        Write-Host $($Adapters | Out-String)

        foreach ($Adapter in $Adapters){
            if ($($DNS[$DNSProvider].Name) -eq "DHCP") {
                Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ResetServerAddresses
            }
            else{
                $DNS[$DNSProvider]
                Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ServerAddresses ("$($DNS[$DNSProvider].Primary)", "$($DNS[$DNSProvider].Secondary)")
                Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ServerAddresses ("$($DNS[$DNSProvider].Primary6)", "$($DNS[$DNSProvider].Secondary6)")
            }
        }
    }
    catch{
        Write-Warning "Unable to set DNS Provider due to an unhandled exception"
        Write-Warning $PSItem.Exception.StackTrace
    }
}

do {
    $choice = Show-Menu

    if ($choice -gt 0 -and $choice -le $DNS.Count) {
        $dnsProviderIndex = ($choice - 1)
        Set-DNS -DNSProvider $dnsProviderIndex
        exit
    }
    elseif ($choice -eq $DNS.Count + 1) {
        Write-Host "Returning to main menu" -ForegroundColor Green
        exit
    }
    else {
        Write-Host "Invalid choice. Please try again." -ForegroundColor DarkYellow
    }
} while ($true)