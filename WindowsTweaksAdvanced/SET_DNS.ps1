# TODO: Implement this
$DNS = @{
    Google = {
        Primary =  "8.8.8.8"
        Secondary =  "8.8.4.4"
        Primary6 =  "2001:4860:4860::8888"
        Secondary6 =  "2001:4860:4860::8844"
    }
    Cloudflare = {
        Primary =  "1.1.1.1"
        Secondary =  "1.0.0.1"
        Primary6 =  "2606:4700:4700::1111"
        Secondary6 =  "2606:4700:4700::1001"
    }
    Cloudflare_Malware = {
        Primary =  "1.1.1.2"
        Secondary =  "1.0.0.2"
        Primary6 =  "2606:4700:4700::1112"
        Secondary6 =  "2606:4700:4700::1002"
    }
    Cloudflare_Malware_Adult = {
        Primary =  "1.1.1.3"
        Secondary =  "1.0.0.3"
        Primary6 =  "2606:4700:4700::1113"
        Secondary6 =  "2606:4700:4700::1003"
    }
    Open_DNS = {
        Primary =  "208.67.222.222"
        Secondary =  "208.67.220.220"
        Primary6 =  "2620:119:35::35"
        Secondary6 =  "2620:119:53::53"
    }
    Quad9 = {
        Primary =  "9.9.9.9"
        Secondary =  "149.112.112.112"
        Primary6 =  "2620:fe::fe"
        Secondary6 =  "2620:fe::9"
    }
    AdGuard_Ads_Trackers = {
        Primary =  "94.140.14.14"
        Secondary =  "94.140.15.15"
        Primary6 =  "2a10:50c0::ad1:ff"
        Secondary6 =  "2a10:50c0::ad2:ff"
    }
    AdGuard_Ads_Trackers_Malware_Adult = {
        Primary =  "94.140.14.15"
        Secondary =  "94.140.15.16"
        Primary6 =  "2a10:50c0::bad1:ff"
        Secondary6 =  "2a10:50c0::bad2:ff"
    }
}
$DNS = $DNS
function Set-WinUtilDNS {
    <#

    .SYNOPSIS
        Sets the DNS of all interfaces that are in the "Up" state. It will lookup the values from the DNS.Json file

    .PARAMETER DNSProvider
        The DNS provider to set the DNS server to

    .EXAMPLE
        Set-WinUtilDNS -DNSProvider "google"

    #>
    param($DNSProvider)
    if($DNSProvider -eq "Default"){return}
    Try{
        $Adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
        Write-Host "Ensuring DNS is set to $DNSProvider on the following interfaces"
        Write-Host $($Adapters | Out-String)

        Foreach ($Adapter in $Adapters){
            if($DNSProvider -eq "DHCP"){
                Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ResetServerAddresses
            }
            Else{
                Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ServerAddresses ("$($sync.configs.dns.$DNSProvider.Primary)", "$($sync.configs.dns.$DNSProvider.Secondary)")
                Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ServerAddresses ("$($sync.configs.dns.$DNSProvider.Primary6)", "$($sync.configs.dns.$DNSProvider.Secondary6)")
            }
        }
    }
    Catch{
        Write-Warning "Unable to set DNS Provider due to an unhandled exception"
        Write-Warning $psitem.Exception.StackTrace
    }
}
