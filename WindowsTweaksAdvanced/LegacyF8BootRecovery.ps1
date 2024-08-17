. "..\Global\Set-Registry.ps1"

# Enables Advanced Boot Options screen that lets you start Windows in advanced troubleshooting modes
Write-Host "Enable Legacy F8 Boot Recovery (Advanced Boot Options screen)" -ForegroundColor Green
$RegData = @{
    Name = "Enabled"
    Type = "DWord"
    Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Configuration Manager\LastKnownGood"
    Value = "1"
}
Set-Registry -Name $RegData.Name -Path $RegData.Path -Type $RegData.Type -Value $RegData.Value
Try{
    Start-Process -FilePath cmd.exe -ArgumentList "/c bcdedit /Set {Current} BootMenuPolicy Legacy" -Wait -NoNewWindow
    <#
    UndoScript =
        $RegData.Value = 0
        Set-Registry -Name $RegData.Name -Path $RegData.Path -Type $RegData.Type -Value $RegData.Value
        Start-Process -FilePath cmd.exe -ArgumentList "/c bcdedit /Set {Current} BootMenuPolicy Standard" -Wait -NoNewWindow
    #>
}
Catch{
    Write-Warning "Unable to set BootMenuPolicy due to unhandled exception"
    Write-Warning $PSItem.Exception.StackTrace
}