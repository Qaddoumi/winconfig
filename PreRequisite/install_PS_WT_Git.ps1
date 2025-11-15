$PROGRAMS_ID = @(
    "Microsoft.PowerShell" # powershell 7
    "Microsoft.WindowsTerminal"
    "Git.Git"
    "GitHub.cli"
    "JanDeDobbeleer.OhMyPosh" # powershell prompt
    "Microsoft.VisualStudioCode"
    "Nilesoft.Shell" #Powerfull context menu manager
    #"RamenSoftware.Windhawk"
    #"samlab-ws.SnappyDriverInstaller"
    "RevoUninstaller.RevoUninstaller"
    "Microsoft.Sysinternals.ProcessMonitor"
    "Microsoft.Sysinternals.SDelete"
    "Nefarius.nefcon" # Driver installer framework for the virtual display driver
    "gnif.LookingGlass"
    "Neovim.Neovim"
    "AntibodySoftware.WizTree"
    "Brave.Brave"
)

foreach($program in $PROGRAMS_ID){
    $installArgs = "install --exact --id $program --source winget --accept-package-agreements --accept-source-agreements"
    Start-Process -FilePath "winget" -ArgumentList $installArgs -NoNewWindow -Wait
    Write-Host "----------------------------------------------------------------"
}

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1

#& .\install_NetBalancer.ps1

& .\install_virtual_display_driver.ps1

& .\resolution.ps1

Write-Output "`n================================================================"
Write-Output "`n   === Refresh Environment Variabels : ===`n"
& ..\Global\RefreshEnvironmentVariabels.ps1
