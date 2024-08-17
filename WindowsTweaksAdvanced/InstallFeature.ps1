# TODO: Implement this
function Invoke-FeatureInstall {
    <#

    .SYNOPSIS
        Converts all the values from the tweaks.json and routes them to the appropriate function

    #>

    param(
        $CheckBox
    )

    $x = 0

    $CheckBox | ForEach-Object {
        if ($sync.configs.feature.$psitem.feature) {
            Foreach ( $feature in $sync.configs.feature.$psitem.feature ) {
                Try {
                    Write-Host "Installing $feature"
                    Enable-WindowsOptionalFeature -Online -FeatureName $feature -All -NoRestart
                }
                Catch {
                    if ($psitem.Exception.Message -like "*requires elevation*") {
                        Write-Warning "Unable to Install $feature due to permissions. Are you running as admin?"
                        $sync.form.Dispatcher.Invoke([action] { Set-WinUtilTaskbaritem -state "Error" })
                    }
                    else {
                        Write-Warning "Unable to Install $feature due to unhandled exception"
                        Write-Warning $psitem.Exception.StackTrace
                    }
                }
            }
        }
        if ($sync.configs.feature.$psitem.InvokeScript) {
            Foreach ( $script in $sync.configs.feature.$psitem.InvokeScript ) {
                Try {
                    $Scriptblock = [scriptblock]::Create($script)
                    Write-Host "Running Script for $psitem"
                    Invoke-Command $scriptblock -ErrorAction stop
                }
                Catch {
                    if ($psitem.Exception.Message -like "*requires elevation*") {
                        Write-Warning "Unable to Install $feature due to permissions. Are you running as admin?"
                        $sync.form.Dispatcher.Invoke([action] { Set-WinUtilTaskbaritem -state "Error" })
                    }
                    else {
                        $sync.form.Dispatcher.Invoke([action] { Set-WinUtilTaskbaritem -state "Error" })
                        Write-Warning "Unable to Install $feature due to unhandled exception"
                        Write-Warning $psitem.Exception.StackTrace
                    }
                }
            }
        }
        $X++
        $sync.form.Dispatcher.Invoke([action] { Set-WinUtilTaskbaritem -value ($x / $CheckBox.Count) })
    }
}
$f = @(Content = "NFS - Network File System"
    Description = "Network File System (NFS) is a mechanism for storing files on a network."
    feature = {
        "ServicesForNFS-ClientOnly"
        "ClientForNFS-Infrastructure"
        "NFS-Administration"
    }
    InvokeScript = {
        nfsadmin client stop
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default" -Name "AnonymousUID" -Type DWord -Value 0
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\ClientForNFS\CurrentVersion\Default" -Name "AnonymousGID" -Type DWord -Value 0
        nfsadmin client start
        nfsadmin client localhost config fileaccess=755 SecFlavors=+sys -krb5 -krb5i
    }
)
$f = @(Content = "Windows Sandbox"
    Description = "Windows Sandbox is a lightweight virtual machine that provides a temporary desktop environment to safely run applications and programs in isolation."
    Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online -NoRestart
    Disable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online -NoRestart
)
$f = @{ Content = "Windows Subsystem for Linux"
    Description = "Windows Subsystem for Linux is an optional feature of Windows that allows Linux programs to run natively on Windows without the need for a separate virtual machine or dual booting."
    feature     = @(
        "VirtualMachinePlatform"
        "Microsoft-Windows-Subsystem-Linux"
    )
}
